Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793536216;
	b=0jtj7W0qXeooEJalVPLaps5yoZtrCjPPeBmneTA4MKe5WI7moLrzQaxCYichPPRvZFsO
	 TWUiVM2easQ5GYhukq9tf9fggOal6CrM/5ArJ5RfNANcfsPGenoueSBnmraKevROzKzW/
	 IGGgmoY+5pKlHB3zZUnoLbGqKRC6JMosFDhWAGf4K51WncVC6mgaUUTcABs+NIGa/ey/T
	 yYuotHrir/LrhiO/x4LUuesdKFZFOIw+aMcamRCxMYN+WcJVZAP923qOMbH60m2rWMcrY
	 LUvQyjCMaIeaysFTnO3R/6YqYy2cuWzpvhHrMR2a2Kb75kaTjZFIR2yyQ0NmG8IjZcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793536216;
	h=Received:Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=1wg6liWZAt3DahnPgsMtTgx/pfzVEsI148X91/GM5IQ=;
	b=vUaxbLYfruaVMZr6rFEE+CyBpCgwcCeWqU00grN1lqiyOpal8VvT1LIaF+JLfAgm3kl3
	 xxMInrnmZWbD6EKonBbX3x/Ke3col9LHiu91y7xm64u5T1MTuFYSN83o9eOsqaHha/489
	 0T5ZhfHnq090eXpF3tE9L8i/CQY01RlOCZtRtmZnaQf8lH+PuTL5u5dz8Dyevni/F8ltX
	 G5QGaPphMC0qPjEeYze8pq7aYGl1EZ5o97xtzj1KoS82NeKWpgNU6pOZsMXNTGPRKikdp
	 S/Yr1fInBpRqq8/xIij07A2gQMQXY1Sem4eUXhIgk7vvW0EAlHmLTmIaanExQOcyRYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HnAQyqjZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9C0606A326
	for <linux-usb.vger.kernel.org@localhost.mlmmj>; Sun,  1 Nov 2026 12:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HnAQyqjZ
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237306513C0
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 12:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1793536216; cv=none; b=ox8b8ZLpVnUAWVZ3FMA5nbHWwiVzr9vnH72eNRbsgKPphFSVHFEFCaUSeQQStfgm1Or3Eop/dNqiDmGJHPCbp8oDTtQaw+kLzyYMCMbfzlXDlZ3GdNLRlsyndPkWgY4LBg7g2U2vv6wVJouC1BURIKRTD5vYWsPxydenkxQJr44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1793536216; c=relaxed/simple;
	bh=RJOhffl5FkISQps107hL9nQcNGM1t0VwypoOhTf6JDs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oELc2oFzxEWkmx60qgSXiOWqAZ66T4s0sXM9thBJZucdKrMyX8HMIK+y18ISxpl70XFrVdAbA+wStltdy9Ptshct5wIVeyrP/2W37NMt/eVlt/9KHf53ziVtVpZq6bwfEjUN6rovbDve1LTTJ+GijaXbD+yE/G2PsLGpw7eoeJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnAQyqjZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7056BC2BCFC
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 12:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1793536215;
	bh=RJOhffl5FkISQps107hL9nQcNGM1t0VwypoOhTf6JDs=;
	h=From:To:Subject:Date:From;
	b=HnAQyqjZKwSv2AndIhbEdvyrT03lNp4q7Y6VqZEl2CsJZJntOISncnGJd4KmGcFAA
	 1bXJEWyP0paQcd3MCABg8pZYiwyNMYII2/8xnvsfXv4kvuBxuH/krvKCc6KnbqX7Sc
	 lpp0dqi8Szsjg4kT1KOB6rcyPb0Np8k+5+AUWw2OKGoPgAbQjhh57WZDR1vrmIMiFg
	 8mG/qAd1h8E/HUF/jig/CpE+HClwRV8NvL3L7YxcdOIC6LZyzCuWf93iWWQ9e56qLS
	 +exA+Va3eRfiamka8gtXtrNg5L2WXr18dzH6eVV4gXJCtHoomOrPQBgoSvR+vUUsft
	 /tLwA+iH5gx/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 45D51C4160E; Sun,  1 Nov 2026 12:30:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222222] New: Kingston USB flash drive repeatedly disconnected
Date: Sun, 01 Nov 2026 12:30:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bram@vandenheuvel.online
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-222222-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222222

            Bug ID: 222222
           Summary: Kingston USB flash drive repeatedly disconnected
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: bram@vandenheuvel.online
        Regression: No

Created attachment 311354
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311354&action=3Dedit
Untested (but trivial) patch

This bug is highly similar to
https://bugzilla.kernel.org/show_bug.cgi?id=3D208257.

My Kingston Technology DataTraveler Duo 64G disconnects repeatedly, both on

- Framework 13, 11th gen, also with kernel 7.2.11 (see
https://community.frame.work/t/device-incompatibility-kingston-datatraveler=
-duo/11477)
- Some ~2016 Dell XPS model, older kernel versions

Adding the kernel parameter usbcore.quirks=3D0951:173c:k fixed this. Should=
 it
also be added to the list?

I created an UNTESTED patch file that mirrors the one from the similar bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
