Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78B2209F43
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 02:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712645; cv=none; b=G5CBJpUJ0pGOl0wFNsmIz1fsEmzZs/mo0jzA3sNczFZ1C7/DrEw+LDhuFH5i4wclXvOaBPY+dN3mWaVmqGfw6CfY8FtyBAPNZX7IxAd7zPojrHZYlA6W/VgQ+1TN3NU/PrUyHjvqjLmYTt8xGRQMAlyPLyH5nLxaQzUFcHfKfuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712645; c=relaxed/simple;
	bh=3IQgZY7Hw7DBVb/yh5yB22pDuVVbGJ1zTXKb4YZ3hq0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uQOEJqWgjqBfXEEJbbrrp24YX4OThUQglaLCiJydesGqOdOBEBzgZJC/yRypcJF+kwPKTKUFLholyiI8WhCx0IetyhgDuDSGQBN2eZWwpg8gT3sWFV8azjuiRjZlkz24/Qyi5r2dovzXhX4hnxgLDG/tyH4B/23GE3KAO5r9hBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBARBXvO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBARBXvO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5857BC2BCFA
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 02:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787712645;
	bh=3IQgZY7Hw7DBVb/yh5yB22pDuVVbGJ1zTXKb4YZ3hq0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hBARBXvOGwrkdQF6cbY018eZsm74qL0wCSVk8pn0ez4DhcJxAZ02hxPc0N+a0d980
	 BadJ+1NjUTGrri/SV5bU8a+2nKqI0UCi3ChM7fdV/lNKzO0rXO05gmGDbv1V4Tt9/X
	 dlkLEaFrbhRa7E5q3Phdaw5Hxr8RXa8IULsGQgU3glU8ocRSyR6BTvNQjQ0yP5LM0K
	 vzq1AFoI4LY318h52p77wkUDT2fBLlliBJA7MbcdJM5/nqiWYruzGtjVxZqL7YtV15
	 gDExNjePRc4Uk3D4yzn25YBUy0cGyH+vZ8Xs3eyTis/8NvlqB8zvKGVml3iiD+ZXK+
	 cgBvuI5LsXBKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3D28FC41613; Wed, 26 Aug 2026 02:50:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220193] PATCH 6.1 082/167 which adds support for Owon HDS200
 breaks functionality of Owon VDS1022
Date: Wed, 26 Aug 2026 02:50:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: huangwei@kylinos.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220193-208809-alPLqUHNlH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220193-208809@https.bugzilla.kernel.org/>
References: <bug-220193-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220193

--- Comment #4 from Wei Huang (huangwei@kylinos.cn) ---
Hi leStoppe,

Quick update: the patch you tested is currently under review on the
linux-usb mailing list. To finalize it, the USB serial maintainer
(Johan Hovold) needs a few details about the VDS1022:

1. Which userspace software do you use to talk to the VDS1022? In
   particular, is it a libusb-based tool (e.g. the Python 'vds1022'
   package)? This matters because once a kernel driver claims the USB
   interface, libusb can no longer access the device - which is the
   most likely explanation for the breakage you reported.

2. Could you please attach the output of:

       lsusb -v -d 5345:1234

   for the VDS1022 (or the full 'lsusb -v' output if that fails)? The
   interface class reported in the descriptors decides how narrowly
   the driver match can be defined.

3. Does the VDS1022 support the same SCPI command set as the HDS200
   series over its serial interface?

I asked these questions on the mailing list thread as well, but in case
replying there is inconvenient, answering here is perfectly fine - I
will forward the information to the thread.

A reworked version of the patch (v2) is already prepared and will be
submitted as soon as this information is available.

Thanks a lot for your help!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
