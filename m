Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E853019D8AC
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 04:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783051238; cv=none; b=vAtMjyuZUmiXJ+9Sbe3aOPP47nZRNYIFjyw6sc4/0LrBS6L45SZkIHAunJclcJQ1ldtrMQ6klzAyQ8Gx6Z5Psnp/i+4B0t0Ki6tFRN91uNj41FO3tbYcO6CpdlCiF8R9GEUb/d5ixiEWz5xn+HiHjIzXsHkeayWLS9IVrVDFtrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783051238; c=relaxed/simple;
	bh=17GXzsmHrOAmH8NZwdJdXiQEi9UNFsmzz79r7E9QVsc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bTiIL+IkNdGQBlDU05bMV02ZmQBZDwep1UqBGRFUMTPzeqT4wuHdgc+FELF9AjP36kREBrE0EhBek4tJVmY/yF7V3BZ6hG4KjqeThzbyC3vvONVIeThl7isQ2dZw+3yrwOV0Sc8LEHPFcX53sMxBLSiJAtrChcSrrdzCTEEPsG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpDqwZX8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpDqwZX8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6A9DC2BCB8
	for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2026 04:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783051236;
	bh=17GXzsmHrOAmH8NZwdJdXiQEi9UNFsmzz79r7E9QVsc=;
	h=From:To:Subject:Date:From;
	b=XpDqwZX8qNoG6jQ1anlaW2tjdePJE2MJa7CYSxq9Pf45qGkk2vmBJ3gAyIIoWjebp
	 UDMTCTHH6vBnAuG7yE4krPrLLIFuDJxC03QFD71e67kEHD+Tg1X9KVoQWz1lnOgj7L
	 Mf8Ki9co7GrC0lekBalpWE4rEANm0L6ZJhEI1qS5BmFePXLtZ6uw+F5Rs0DvQXzNR0
	 KWx08lpZkIY1uY+XsA2ZB7ydN3gl/GP5K4DIRpUjJtJsRS55MTM3uzHkbfw1ndzUPH
	 vmgx/zF5jAHHKszHaTuSu6zV3bkEZ/A2nuIibijgViMp9OkKuCQlQX0jPYLdpP6S2a
	 y+YzdaxihW/aQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 42C68C3279F; Fri,  3 Jul 2026 04:00:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221716] New: JHL9580 Barlow Ridge TB5: host_reset timeout, PCIe
 tunneling broken
Date: Fri, 03 Jul 2026 04:00:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: liqysir@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221716-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221716

            Bug ID: 221716
           Summary: JHL9580 Barlow Ridge TB5: host_reset timeout, PCIe
                    tunneling broken
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: liqysir@qq.com
        Regression: No

JHL9580 Barlow Ridge (8086:5780/5781) Thunderbolt 5 / USB4 v2 host
    controller has incomplete Linux support through v7.2-rc1.

    Symptoms:
    - host_reset times out (REG_RESET HRR stays 0x01, even with 5000ms time=
out)
    - REG_FW_STS is read-only (0x00000000), ICM firmware cannot start
    - USB3 tunneling works (XHCI pass-through), PCIe tunneling broken
    - eGPU GPU never appears in lspci

    Tested: kernel 7.0.0-22, 7.0.0-27, 7.1.2 =E2=80=94 all same issue.
    Hardware: MSI MS-15M3 (Arrow Lake-HX Ultra 9 275HX) + GIGABYTE AORUS
RTX5090 AI BOX.

    Root causes identified:
    1. get_upstream_port() in icm.c does not recognize 0x5780
    2. icm_probe() has no case for 0x5781
    3. icm_firmware_reset() =E2=86=92 pcie2cio_write() times out on Barlow =
Ridge

    Patch attempted (adds 0x5780/0x5781 to icm.c) =E2=80=94 icm_probe succe=
eds but
    CIO reset times out. Correct Barlow Ridge CIO reset sequence needed.

    Full diagnosis email sent to linux-usb@vger.kernel.org.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
