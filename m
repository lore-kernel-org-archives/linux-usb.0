Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D4E3876B8
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 09:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512648; cv=none; b=YbYlZvYZzFMV6/ZCAWQ0AFBl0neIzgwg2KoCtehN5ECg+fWw6NI/yTDUOj1IMhRgr3w6QDtYqwW7glSX560c8Lr3JxGiDT+Ds2/2gMa8igj3m/EF2pare4A0RD5RwRbKzUddKuwL1b3QTOkxasurbzkE2VywDLbw4VLqysGYKyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512648; c=relaxed/simple;
	bh=2SNnZVw57053gLqVBAlVZsz1LPjDpAkHVOq0y69lLjs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ol8mpk/PKw6pXAoWDDf2XxNrfrRgXHXhcAR70Za05th1I4cTKcQT24lDPW49lp+LTqBvcV01JcROiOB9+SHLc7LaDHTBlIUQfPc5TDckFvcUCKSJ1PeXzhEK+8NFq8ApUmmXxuerrY1JTKAhwVggYrGQLvyW5waUa/pdWTYC5+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TninFAuH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TninFAuH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47E0EC2BCFA
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 09:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788512648;
	bh=2SNnZVw57053gLqVBAlVZsz1LPjDpAkHVOq0y69lLjs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TninFAuHtJUPY1cONd3vkxHd+D+thfRmnT8dEbjo4+rQwgG7LcOP2z21htAKOk08T
	 JKeFx46lIk5Ol8K6RnTCXETsZWG+qQvU5VhGeV6Yj3bOTJC4gbDq0pMUhtqqv70GhY
	 R4zpj2DVQ3tdOGBQRlPGRDsyRM5mLySlzr/dxk5DR/XWZO4/I7+7+ZMDKw8Jxd08W3
	 GIaAdAxO+P4/nudWwWyeqeuFEY+AyEmjjmcg3dUQf1Y0rjPClvyVRsDc69S8JqoKGa
	 BVRCN8VBd37GBeSenacQJbe5bq8Xj0JUZhVxa1ndMmVvysHfKZ7b1AC9rbi743Mefc
	 TERHfIn5GMSJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 29967C41614; Fri,  4 Sep 2026 09:04:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221963] uvcvideo: Realtek Integrated_Webcam_HD (0bda:5696) RGB
 sensor never delivers frame data after STREAMON
Date: Fri, 04 Sep 2026 09:04:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221963-208809-bifchbEWyz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221963-208809@https.bugzilla.kernel.org/>
References: <bug-221963-208809@https.bugzilla.kernel.org/>
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

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #2 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Chandra Joshi from comment #0)
> Created attachment 310780 [details]
> Open the file I made (uvcvideo_bug_report.md), copy everything from "##
> Summary" onward, and paste it into the description box.
I would rather not do that :)

(In reply to Chandra Joshi from comment #1)
> Isochronous transfers on Ii:1:004:1 complete successfully (status 0),
> confirming USB-level data transfer genuinely occurs =E2=80=94 this is not=
 a
> transport/bandwidth failure.
> However, every single isochronous packet returned across the entire
> 10-second capture has payload length exactly 12 bytes =E2=80=94 i.e. only=
 the bare
> UVC payload header, with zero pixel data ever included:
> C Zi:1:004:1 0:1:5224:0 32 0:0:12 0:2814:12 0:5628:12 ... =3D 0c8c0000
> 0000eab5 86008a02 00000000...
>=20
> (0c =3D header length 12; 8c =3D bmHeaderInfo, decodes to EOH=3D1, SCR=3D=
1, PTS=3D1,
> FID=3D0, EOF=3D0 =E2=80=94 both FID and EOF remain constant/unset for the=
 entire
> capture, consistent with zero frame boundaries ever being signaled)
Do these 12 byte packets keep flowing forever until user application is tur=
ned
off, or do they stop unexpectedly at some earlier time?

If this is truly a problem with the camera or UVC driver, not with USB itse=
lf,
then you have reported it in the wrong place. Follow instructions here

https://docs.kernel.org/admin-guide/reporting-issues.html

and email uvcvideo maintainers with linux-media in Cc.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
