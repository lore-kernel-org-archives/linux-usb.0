Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118673;
	b=iBgfNwTn680cUI74hE15LUuw/hjI489eKdBmkRikcSC8eRlHAMfh4oJYzmnhII/M8rEZ
	 aSL4hrb22Gn2If6tHCkHL2+n6vaSBES7S/al4UBiNcp7oPMrL/fqkcyMtY2YpL8o0T4fn
	 Fo3ouJ5t8ftQuycuy54Vy8NnUWna2MwDYXnb/5XKoP4tGStHByW/XabZNcQRo6P6vkIrn
	 o6m4VINocRUspp+87fzUCzM4WI2MqeNUjkNWI6qnJWaexhvR4ci7Sjpa6u4hPfQe8IEnn
	 GAXHngz3lSx6R7QQ4/XD2mRi0cAER6TUFBQWfUdXpXH3do5Nqjk+zq++/jUQbkD9l9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118673;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=HVTXCNOayZp++Zqn1nE9W0I/IgDsjGqpjohUSqKosx4=;
	b=SLMFLDNo+VYwcupamUfOSuPWPmxWvRE3y5pef8bGsdu9YCUYjkbE96TrK9IAzV0u7z2t
	 ngx8mzrFNRvLVkyRn8Pi1If6iRzU+J/C5tAxyoNYSsO/JRGOEY6duUmJkkCyRwtJt1b00
	 qrXdH1Bi1KyFMnZrOdFu4LBJizqyn9u80T2Oso+vGFeYtl8m2HcnCK6AoXSpuaV9V4hMj
	 JHizYEHN/Z4DUxGfPeWZ4QC+Fjw+Mfh/QNJ1su0lvDr4Vqrrsc6pHcdOypDEx+tXgJxZc
	 XEFcEatKCVeNjuNf3XxbWeM1uJR4shH2dncZQUBZ5xLrw3A1+VAeIbmiEfxo2WFm3zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PvObmYkW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B89606A324
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 20:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PvObmYkW
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D1171F000C7
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 20:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795118672;
	bh=HVTXCNOayZp++Zqn1nE9W0I/IgDsjGqpjohUSqKosx4=;
	h=From:To:Subject:Date;
	b=PvObmYkWR3m/BX+nd7lmF5obsmpHNBw2JIIRFyWwf0yHMg2osqd3/R3JNDYLA/V2w
	 kBYyM5xPrURhF8UYLTdbdNEmbS7NkCyQi6so6E9lhDgmeeOC3GqmTeYLdcvWOWGG8M
	 +6IbWO9RK8v2To5OU2GuEI7wIbMYOom5u0WBivNEpBome/zLa8zKiOO5KYZqVQUWYp
	 KgSDynqN5dCej7BxcctNA9AJCEqTJdt2xvSvAx3/a8tVHMwe4H6FfEDMTd1S0+D+Qf
	 XqMhzDATwjFswSqua0IeBCqkNwrkhnAUciiqZUrIAm8nc4NZiA4dUOPet/B3Y1K+uh
	 ANFjp7+A8y9dQ==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 28DB4240040C; Thu, 19 Nov 2026 20:04:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222298] New: hid-steelseries-arctis kernel module not working
 for SteelSeries Arctis 7 1038:12ad
Date: Thu, 19 Nov 2026 20:04:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: linux@michaelgronbak.dk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-222298-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222298

            Bug ID: 222298
           Summary: hid-steelseries-arctis kernel module not working for
                    SteelSeries Arctis 7 1038:12ad
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: linux@michaelgronbak.dk
        Regression: No

Created attachment 311524
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311524&action=3Dedit
Logs showing usb device unplugging and plugging to make headset work

SteelSeries ApS SteelSeries Arctis 7 kernel driver not working.

While Headset is active no problems arise but when headset is shut off USB-=
puck
is lost and the device driver no longer exist and 6 log entries shows input=
 irq
status -75 received.

Re-activating the headset no audio is obtained and the device is not found.

Unplugging the USB-puck from the USB port and re-inserting it again might m=
ake
the device come back. Sometimes several attempts of unplugging/plugging the=
 USB
device
in combination with turning off/on the Headset it start working again.

The problem is gone if not using LKM: hid_steelseries_arctis

The problem has bee around for a while now (1-2 months) and is currently
present in
Arch Linux kernel version:=20

ArchLinuxDesktopPC 7.3.4-arch1-2 #1 SMP PREEMPT_DYNAMIC Thu, 12 Nov 2026
20:11:37 +0000 x86_64 GNU/Linux

The attached log file shows sequence when trying to provoke the error and
getting the headset back in working state.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
