Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E02D4749F4
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784737884; cv=none; b=TXft7/7eE8dIn7uYPesgJsAjZ5zWztANY5O7TQ0tBho8zsEx+zh9HsLSgo+DReODvxbdvYFuWNrY2RCT0TuNYH0719rpGbnk7vZKpnpcGcoB/NGJ7GU2nuh1AmOZ6ns5+p48KzrRfAZ+1V+wwIVxAQFDVM739oJKyhR01RLDoQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784737884; c=relaxed/simple;
	bh=r9jMaHrgUqWdKgQ1+sPm2OlhyhqGdlTMiEg/av9hP84=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kHtzxrM82iawTqH0iuAzLO16FBZkiD6ITjWBdAfMNOETiEUzDvndcIguh5e5BcWwqGxN5pebhlvJ3XM8H7b3ZmOPBcAkkZ7RXgEh13eQwtFti+OetTOory6w9SVnxmCoA9Op7epR4iJnaUsgur+NM3O/7vkqxHZLB9lmmywyv6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQclxX/t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQclxX/t"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F032EC19425
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 16:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784737884;
	bh=r9jMaHrgUqWdKgQ1+sPm2OlhyhqGdlTMiEg/av9hP84=;
	h=From:To:Subject:Date:From;
	b=ZQclxX/tTJXi4+k5+L+wGRuuFwxXpwfevnWryLoFMMaFQRy+0c1WkMrmjUznpeX1u
	 9XFDG0ECQIrmBq/D5FF3RsXOQG6PC4UOC95iJqOjba2L4Bp+rRTyBQgwOogW8JUeqO
	 1Ga0ftDf3taev29AFw7H6T+MRaPDqZKX2Bq7lhn/cuPU1sb0BU+VgsGrTzA7Y2KHls
	 whOHgecw3w/p9IWbqbAFQMP+ymgskB/8EFTHSDKEeb8Cjl8c7trz/oKZxQjsaBuz3m
	 xyG42920b53vXVOXres0AblJ0dSTMNl0kTNxJTCpO5xlwFN0h4lWR+5RVhHgTObN2r
	 yIGZolh4j+1kA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CAF91C433E1; Wed, 22 Jul 2026 16:31:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3NzhdIE5ldzogW1JFR1JFU1NJT04gNi4xMuKGkjYu?=
 =?UTF-8?B?MThdIEFTVVMgTi1LRVkga2V5Ym9hcmQgKDBiMDU6MTliNikgVVNCIHJlc2V0?=
 =?UTF-8?B?cyB+MS9zZWMgdW5kZXIgZEdQVSByZW5kZXJpbmcgbG9hZCBvbiBSYXBoYWVs?=
 =?UTF-8?B?IHhIQ0k=?=
Date: Wed, 22 Jul 2026 16:31:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: m.langas55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221778-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221778

            Bug ID: 221778
           Summary: [REGRESSION 6.12=E2=86=926.18] ASUS N-KEY keyboard (0b0=
5:19b6)
                    USB resets ~1/sec under dGPU rendering load on Raphael
                    xHCI
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: m.langas55@gmail.com
        Regression: No

Hardware: ASUS ROG Strix G16 G614PM (AMD variant: Raphael iGPU + RTX 5060
Laptop dGPU), BIOS G614PM.316 (latest from ASUS).
Internal keyboard: ASUS "N-KEY Device", USB 0b05:19b6, hid-asus driver,
attached to usb 3-1 on the AMD Raphael xHCI controller (1022:15b6/15b7).

Summary: since 6.18, rendering load on the Nvidia dGPU causes the
internal keyboard's USB device to reset ~once per second
("usb 3-1: reset full-speed USB device" in dmesg =E2=80=94 4,557 resets in =
one
8h boot). The resets corrupt input below userspace: evtest on
/dev/input/event3 shows missed key presses, releases arriving seconds
late, and missing autorepeat. In games this manifests as stuck/dropped
WASD keys.

Trigger isolation:
- iGPU rendering with dGPU powered but idle: CLEAN (tested via
  supergfxctl Integrated mode).
- dGPU rendering by application: resets begin
  immediately (70 resets in the first ~2 min after game launch).

Kernels tested:
- 6.12.75 (Arch linux-lts): CLEAN =E2=80=94 0 resets in a full game session.
- 6.18.38 (cachyos-lts): BROKEN.
- 7.1.4 (cachyos): BROKEN (retested 2026-07-22).

Ruled out: EC reset (no effect), BIOS (already latest), hardware
(machine is clean on 6.12).

Distro: CachyOS (Arch-based, rolling). Nvidia driver 610.43.03 via
nvidia-open-dkms.

Multiple users with G614/G615 models report identical symptoms on the
same 0b05:19b6 device:
-
https://discuss.cachyos.org/t/keyboard-input-issues-on-asus-rog-strix-16-20=
25-with-cachyos-during-gaming/30823
- https://github.com/ublue-os/bazzite/issues/4590

I will be away from this machine until ~2026-07-24; I can respond to
questions and run tests after that. Other affected users are active in
the CachyOS thread linked above and may be able to test sooner.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
