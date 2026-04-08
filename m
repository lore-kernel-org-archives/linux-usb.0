Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316AF3B19A3
	for <linux-usb@vger.kernel.org>; Wed,  8 Apr 2026 18:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775673465; cv=none; b=OBWS3lL8/SnOXX0HU+LpZLW5gg9vXbwrNtt2OpLNk+m+69O9jhxa+HmYheAWZDGRHx9yMwnLcJxX7Vglz5oME+zQ1ck1oHy3hEpIcL6QMztLaZuEkrujLgQD2VQ+VOe9vpO4oj9Xegra5mZug6oiGMroVWnszbsoeDM6MCLzh9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775673465; c=relaxed/simple;
	bh=X+KuMhWmjKp5MqE7yRFJVr1IwP9hDO2cQ12R/Sp/F1M=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hV/A6mJ5LNVm01XUA0DAcnZpV8HV4jh8bZpLUoCEhYA6DxA0Y4ddJopJ/TuTYfOj3OMGiHLp/1RPrZTu39FJnssJVMrWvokvlH08iDln9Nbifv5Jfv5kkjmPSH31ZRD5hJEC6NHzGjivzLJEpR9D5jAnuNgKgVHk8MVkTch96m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLhYFVCG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLhYFVCG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 104C1C19425
	for <linux-usb@vger.kernel.org>; Wed,  8 Apr 2026 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775673465;
	bh=X+KuMhWmjKp5MqE7yRFJVr1IwP9hDO2cQ12R/Sp/F1M=;
	h=From:To:Subject:Date:From;
	b=cLhYFVCG0FGutZVsJE/pkrkqMU+6dYoHTLXp4b7NE5gR1UQkoIt9z4Ltl9V32Wbbm
	 P77Aio7VPJJd757o2TR3YVeVXmUEOFYc+5h+3529zJUj77fSZX+afi8nbHTlEamY+k
	 ZidH2qo4YP0Fchg91/MHc1obsppB/p0R7WYafWAK21oBcFeqNw52U80sqy2I2HCI1v
	 827lNj1Bb1fTmGdOACbvJ34iXHxP5H1yOcTxZKCrxYYiBvH4P6zE0gBYf9f8vlQuUn
	 /aaKHnFA7AuiNaLUeO72liJmLIVK54FzJhVOQt5iL+gc3Lp0cZQgaOdIvuie4nX6mk
	 mZWj/9TjzFBsg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02B72C433E1; Wed,  8 Apr 2026 18:37:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221337] New: Regression: USB webcam (0bda:636e) fails to resume
 from suspend on 7.0.0-rc6
Date: Wed, 08 Apr 2026 18:37:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chromechris@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221337-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221337

            Bug ID: 221337
           Summary: Regression: USB webcam (0bda:636e) fails to resume
                    from suspend on 7.0.0-rc6
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: chromechris@gmail.com
        Regression: No

USB webcam (Realtek 0bda:636e, "ASUS 5M webcam" by Shinetech) fails to=20=
=20=20=20=20=20=20=20
  resume from suspend on kernel 7.0.0-rc6. The device disconnects after=20
  resume and does not reappear until reboot.=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20

  Kernel log on resume:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
    usb 1-1: PM: dpm_run_callback(): usb_dev_resume returns -22=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
    usb 1-1: PM: failed to resume async: error -22=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
    usb 1-1: USB disconnect, device number 2=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20

  The device works correctly on a fresh boot and across suspend/resume=20=
=20=20=20=20=20=20=20=20=20
  on kernel 6.19.11.=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

  Hardware: ASUS ROG Flow Z13 (GZ302EA), AMD Strix Halo=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
  Working kernel: 6.19.11-1-cachyos=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
  Broken kernel: 7.0.0-rc6-1-cachyos-rc
  Distribution: CachyOS

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
