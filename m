Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143470;
	b=LEVkzS6uDWbDzY1ur+lUb4WFmGGPSxGrlQHS8gaXuDZSp0EqamHC+8Mp2CpQ8MYAVYm6
	 +tB8/ZlcB6m8O569db6pa7mCTkASB1maxlgAhV4OvgGnFc2F7MrbE4fgGovNaQ+eKrYmB
	 42tuI+BkzDqPk+2Cz2aQbjvlDkHcpIQl1CVvvYaiksTc3TrxZUKsAh3CWgbodqnrIhCq2
	 Hjv3jMA4gE2SfSo/cyK98G4cGqsxrdMq65Krm0aqH1+oWlOiS7xQnRViKr++uVZ5sU/YI
	 gEWAbSa7IEv6KNj0/iD9PxcH0dfA57tMu3K/9otUFZgdnRpT+xAyEa2vef5hvuU9How==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143470;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:MIME-Version;
	bh=JVj4mgufIasPAq4mPPKinusBliauEAwBEpFY7KcrlDw=;
	b=w1VWKnyenmz7Fwh/r8wZlMKEFySwd2kQfQGi9tPXLu8L4TaFLaci4PKtp5kDutSYhgS3
	 ggkyqo/Plt+UCa0F+d/kk0aXr4wYUQW4Bo18upMm0vQC0lLDONBvd5g5TruKrUpp25lUU
	 ugSccZZtTYuMkdbTuBrG+fSL31WhDFa43pxBLdsYMuv7LLmcWtZApxUNBYU0bEPPb5Kz4
	 LPoDR85hcLAvRdtg49UMky/dTvnvRZXxgH2BHlqDiloyZmxNyQA6xUkIw9TPCmJGS3Fyr
	 RGwIl/CwEv9IqndRXU40BlqbveU6m0BE6+axWK4G9yzG/oQoTJVyP85aQCV2qk9DmGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMwITDUP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F65606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 02:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aMwITDUP
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91DFF1F000CF
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 02:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795143469;
	bh=JVj4mgufIasPAq4mPPKinusBliauEAwBEpFY7KcrlDw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=aMwITDUPGuPbD1CacwEKO47+a4mOl4j2zP4tmiyZLDOhqQ6EYFLB3jC4BELBB7oVq
	 aEKzs3JZi3paIwMrQpvOhwh1VK9h0BVRPchBP0Lsk0rmbAEyAbUTXsn+93cDrK3Y9W
	 uJwYzkBaS9sMU9UkCU/37fUjo2OiBkGU2TF4dWt60iCRBhpkicqygDF2hJECyLACaA
	 WwYVKYqrMT8A3OJI+n77a72RCcFut3W0JamJLlPsGu5W4NzuOwqfmAQHE5jFoQTmcM
	 RJIno2dR9ZdcFqfWN5bsI6XdSTWxafjSppLSTwvdoe6LFgIhSQ1uDegqbl2RXJVU1M
	 vHgHSxkNOocuw==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 8BCFA240040E; Fri, 20 Nov 2026 02:57:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221142] ucsi_acpi actively breaks USB-C PD charging on Lenovo
 Legion Pro 7 (Arrow Lake)
Date: Fri, 20 Nov 2026 02:57:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daway320@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221142-208809-7iyiepIC4y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221142-208809@https.bugzilla.kernel.org/>
References: <bug-221142-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221142

Wei Huang (daway320@163.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |daway320@163.com

--- Comment #4 from Wei Huang (daway320@163.com) ---
Hi Alex,

Syncing the mailing list outcome here for the bugzilla record.

The v3 patch ("usb: typec: ucsi: do not register UCSI on Lenovo
Legion Pro 7 16IAX10H") has been withdrawn after Alex's re-test
showed the premise does not hold:

- With ucsi_acpi and typec_ucsi blacklisted and confirmed not
  loaded, USB-C charging still drops - the EC itself loses sight
  of the adapter (ADPT clearing in EC register 0xA3), replug or
  charger swaps often do not recover it, and only a power cycle
  reliably does.
- Windows on the same machine charges reliably over USB-C using
  the stock Microsoft UCSI driver (UcmUsciAcpiClient), so UCSI
  traffic itself is not what breaks charging.

This means the ucsi_acpi driver is not the cause on this machine,
and the issue is being re-scoped to the EC/ACPI layer - the drops
coincide with bursts of "workqueue: acpi_os_execute_deferred
hogged CPU for >10000us" warnings from ACPI/EC event handling,
with UCSI not loaded.

Leaving the bug open for the follow-up data. The mailing list
thread, including the withdrawal and the suggested next capture
(an EC transaction trace during a drop, to separate GPE handler
vs polling query vs buffered event burst):
https://lore.kernel.org/linux-usb/20260902090531.2134150-1-huangwei@kylinos=
.cn/

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
