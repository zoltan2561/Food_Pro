<?php

namespace Tests\Feature;

use Tests\TestCase;

class AdminOrderingSwitchTest extends TestCase
{
    public function test_ordering_switch_post_requires_admin_sign_in(): void
    {
        $this->withSession(['_token' => 'ordering-switch-test-token'])
            ->post('/admin/change-status', ['status' => 2, '_token' => 'ordering-switch-test-token'])
            ->assertRedirect('/admin');
    }

    public function test_get_request_cannot_change_ordering_availability(): void
    {
        $this->get('/admin/change-status?status=2')->assertStatus(405);
    }
}
