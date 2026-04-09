Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EACA3368B2
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 22:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775773764; cv=none; b=MPvMTn+y8mSfw5aFQbFVsqqN+tfXV8cVx6E3AEzXdqnrKtHXVfyo+FMe4wW/JGZdckLz/RTSyU36NR2XN6ok97vRTqGM3xMVCbVl9PKJ2wm2sbUSbZxwR4JTkYV20YmgU53jhRIUHYFbhxlklI8SjbVw76BH8QfZa+MPMmTN28w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775773764; c=relaxed/simple;
	bh=QccvQufHuAH+E36gFTx4AbHsPpKjea6a90NECPKty4M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rpdtD5WYkDvBa3lni3BmBqeyce9/F6BGSqk8RQMGOHY3+LnCVulvdKeV7RhkyT6G1nklusdyCE2EpPEyHNexHW7c3nks4amKaOAjrZPJbrX9wLuZu1u93lcDOwyszIMpPXWVo5EC5jYnhSasJQ1dh61Le7okAWMfSfSIgYX3Q8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iqu4o7rh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iqu4o7rh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2FFFC2BC9E
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 22:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775773763;
	bh=QccvQufHuAH+E36gFTx4AbHsPpKjea6a90NECPKty4M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Iqu4o7rhqdN4eUrsWfbLCjgX5EuZXdXssBUgjZfHFEcQXpu2cZvT6No3TRSgS0G27
	 o01hJSaBZeUO8UBEeDLSd3MUHW0fBRu3ULoKwlkqnv1oQ8EExHK2REfRWyVa8ki+3d
	 OcJHHhF9MA47kL+pOz2C2C8skzdkxhaPtvwV9rbDFBuV0VzHDjBnw5egPqn59nzMgT
	 +DOy14IxIXQ8rOGTNietoJ+QTWALs5wFaal4yhRxNRw1NmwillOQSoKz+HYatVOWkA
	 CPcSVBfTMn3T/Mxc+raKN+ztGk028owNpRdazOuXISFHoA8ITH7bGBk5FTlPuN3JGX
	 HRrZ02gVQbzFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ADD59C41612; Thu,  9 Apr 2026 22:29:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Thu, 09 Apr 2026 22:29:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: manauer.uel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221318-208809-vl9WNwIifK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #21 from manauer.uel@gmail.com ---
I just tested at a second location. Same MacBook Pro 13" Early 2015 and same
ASMedia ASM1042A, but a different monitor (LG 34UC88-B instead of LG 34CB98=
-B)
and a different mouse (Logitech G403 Prodigy, 046d:c083, two interfaces bot=
h at
1ms). Same issue, same workaround fixes it.

    Bus 003.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, 480M
        |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
            ID 043e:9a10 LG Electronics USA, Inc. 34UC88-B
            |__ Port 003: Dev 003, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
                ID 2109:2813 VIA Labs, Inc. VL813 Hub
                |__ Port 001: Dev 005, If 0, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
                    ID 046d:c083 Logitech, Inc. G403 Prodigy Gaming Mouse
                |__ Port 001: Dev 005, If 1, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
                    ID 046d:c083 Logitech, Inc. G403 Prodigy Gaming Mouse


    Interface 0: bInterfaceProtocol Mouse, EP 0x81 IN, bInterval 1
    Interface 1: bInterfaceProtocol 0,    EP 0x82 IN, bInterval 1



I also plugged in a no-name mouse (China Resource Semico, 1a2c:0043, one
interface at 10ms) and it works fine without any workaround. Same controlle=
r,
same hub chain. The 10ms vs 1ms pattern holds here too.

    Interface 0: bInterfaceProtocol Mouse, EP 0x81 IN, bInterval 10



I also noticed that all mice work in the OpenCore bootloader, same as on ma=
cOS
and Windows. OpenCore uses the EFI USB stack, which presumably keeps the
interrupt pipe active without idle logic. This fits the theory that the pro=
blem
is not necessarily in the ASM1042A hardware alone or in usbhid alone, but in
the combination of those two.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
