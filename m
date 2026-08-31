Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2943AB287
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 02:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788144992; cv=none; b=KjNxeorJSUfV0dmwSaznshZbCPcgEP9JQ3NE77Pai+nghRX5YnU6U81/5AYZgC/jxxSVG1DwNVJOpv4P4KxqZid8PfkJKdolJyOxqAiVkxVG7si8CGJCxpwOi8HwjO0/TPTSph0XlXr2Kv1fd3LAHaaoQfVzEKjMHzLq/6JrLl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788144992; c=relaxed/simple;
	bh=J8cRcyRosPoYBpYJg4rA+q0U/sBrmTAsRvFKa1ugPcE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lnbjip4SUuV/qC1UzPH3azJMyWUtgxeznT2b0Ipz/rSQc57+6xuxWfW+6AxiM1LW73ogEmC4L+ZHmv61kQgnP5hFQKADr8RE2uXKF0Kr2dKZMtCR8HVIXd78Uq4RHDt8SHfshD6NRJjBUMzKsuCCo6eTRRzb2CtihAaMSnf8Yp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mI/oGI9K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mI/oGI9K"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C051C2BCFA
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 02:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788144992;
	bh=J8cRcyRosPoYBpYJg4rA+q0U/sBrmTAsRvFKa1ugPcE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mI/oGI9KidrOoY7xzaEEzYOnOVMiTluUyi1yBw93iMLbT1wNUhTgSBVlVXO69VK4a
	 6SOcR02wyKfoQ47b9woT0zSCpJp/ddgMojYtsECICLxQ22VdO0JSLzsARAS3GoNyaW
	 O/Rpigi3db+iGx1JEQMUEBZhEcw+jSIUvQGMVkeeIiFemSZQvj5t4j+YMZE9Bi/A7b
	 cZSsiSUbN0iWD+MvPHhmNZN290r4LwxvobWF+zozovUWeOPpDyMqHDJ2qFRHFC0Qtk
	 tvagtHPXzt7x41qTo7mNEUdJrwID/+Ppg/KHDPraWURpjjHxCUakduMVeoI1FVCnp8
	 YxfgMOvYnpDsw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4ABA2C53BC9; Mon, 31 Aug 2026 02:56:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Mon, 31 Aug 2026 02:56:31 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-7BV73Y2Ktd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #34 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Makes sense, I only suggested the alternative placement to confirm that this
line is really the trigger and not merely a timing accident.

Crazy idea - does anything change if you replace xhci_read_64() with readq()
and drop the 'xhci' argument? Probably not, but that would be a very cheap =
fix.

If not, it looks like the xHCI FW just isn't ready for action and it somehow
manages to bring down the whole CPU.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
