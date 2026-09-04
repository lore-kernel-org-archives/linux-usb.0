Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B5836494F
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 06:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504345; cv=none; b=ia90SAQJBZ0vrYgpgPLs9m0ad2rHXHV8x7bIk2i1RaRtc8Cu1IQKhC+LS6q5r7pX8KOBtlsrW+zmFEdg2basB9XWH5Z2QjVogeoLg23vRjTvjKIoZ1nd+3y7ONjx8ZLEr+/cDVvUBAcbI9kOuxW2MGUXL6vjR1h7i9cC+X/XhMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504345; c=relaxed/simple;
	bh=F0/OH89O5EzhrW1UK6Ndz515eFNViWxMVpbPOZVDza0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JDpfY/ivaOiyFoE1X9+OXtH3UycqIVIKnsxtOzRcisuX2mFWEwJN8H/peN4cggqjONNEFegEchn03h3HaNzmIaZiyGK5yISqS3ZKyZVJj2Ndyvs+PUXnu0yCfJJ+yA/2q9kgsswFnkeAsHXrUOnfZU57MkXjUxoecHIph7wqGDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iuS6rSWY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iuS6rSWY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 198F2C2BCC7
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 06:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788504345;
	bh=F0/OH89O5EzhrW1UK6Ndz515eFNViWxMVpbPOZVDza0=;
	h=From:To:Subject:Date:From;
	b=iuS6rSWY3IRtTlQfwyxBpgJhKcBxG8Zb/OyjNfVvVQn+Zca/PUg8H1wyPwtCjFDKS
	 tlurZ3xU7o/uH5iqBQGUjWxWqoMZyN7hsVMmEoaGl55BPIIeHVS7G3DDizTE2P+SEk
	 yxz9s/prg6Sh/QLxW6IbMxeL6RRo615sZfOVwUblCXw56+krN0GKRecRsvV3HV3Ev8
	 UEHXCP2WAbMei55sV5+7a4GfXts0RXTmckYyuO+5TFvZLg/R5fQzZypWTssbmFeoxv
	 TmWAhwS+q9zZLWaOw/8MbLZNfa1t3S7tCxvQ05VEpWRoO9fg0EX59QMKxHCfYHpztD
	 Lnq4xctBNexsw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F18CFC433E1; Fri,  4 Sep 2026 06:45:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221963] New: uvcvideo: Realtek Integrated_Webcam_HD (0bda:5696)
 RGB sensor never delivers frame data after STREAMON
Date: Fri, 04 Sep 2026 06:45:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cj897048@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221963-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221963

            Bug ID: 221963
           Summary: uvcvideo: Realtek Integrated_Webcam_HD (0bda:5696) RGB
                    sensor never delivers frame data after STREAMON
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: cj897048@gmail.com
        Regression: No

Created attachment 310780
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310780&action=3Dedit
Open the file I made (uvcvideo_bug_report.md), copy everything from "##
Summary" onward, and paste it into the description box.

Open the file I made (uvcvideo_bug_report.md), copy everything from "##
Summary" onward, and paste it into the description box.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
