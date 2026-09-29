Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CF851E447
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 10:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678870; cv=none; b=ERazWNxnQaCHO51iQ65+1FW/q0AEuoyFEQ6YbRLwJLp941wqaM3wMr9hZ6Dtam5UfObJq/5n6NRyQ+fpj3BOlN/EHfYmTGTVWfzLj842NcXh/JLcR+PLqQcUVqQT4ihhEVYzQjYoGOsOaM2IjZZWdDYS0WpbBvICJsNbWCltJEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678870; c=relaxed/simple;
	bh=ZEQ3Qb0bfnnW4jxzxRI3MfSfuGxw5g55ydGrVU5hcZM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HQcUucpzRuTHe2wjzyMRZeSGaz2OkqkBIyDJ9JjtHZ0TrGhnwvQYOzEcuBUozaPzBxMgfwOfxY9OEMm6C3fPJIdtwwQs8qXocdEywffmcI4OGB1Ur/eSTID9sfUf7jOGDfBnpDc/6PHtqkSEB3Xfm1X/27fYqSqp87OwR0Qzku0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rf/iQtTj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rf/iQtTj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22588C4AF0B
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 10:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790678868;
	bh=ZEQ3Qb0bfnnW4jxzxRI3MfSfuGxw5g55ydGrVU5hcZM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Rf/iQtTj6ROSAN7KDB2kwztDPffgYWHhj5Nc80U57AkyuYt9ZTHtsBPv5wkyIDxbv
	 RIrwTLmv16Y61VpAk6sjSCDKEQckUbotmxLoSjPF6EpXwcPoWDv5XmB8UQZV/bbXbT
	 FOQLl4BjhMCU01t2do6/SONgjvvQaeMQSH14P3ottBfMqA+PRKNJ0Jg2uAtLpyGWk4
	 RDS/C9/EgH8qlQDs/yzThQRVzpzIrJxovhOM7Vivq6kW0LHHkyn21ArKFVRxaal1xs
	 tYnTuHY0/KfnBDUnZGOuFadHxlUf7gFOOSf8dJdLufAyXxX06d9D543LLgnAVnwhn+
	 dek4E66li2vXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1113BC41613; Tue, 29 Sep 2026 10:47:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 222071] [Bisected] [Regression] xhci_hcd: Resuming from
 hibernation fails with "Not enough host resources"
Date: Tue, 29 Sep 2026 10:47:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-222071-208809-wbLY9Poi5N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222071-208809@https.bugzilla.kernel.org/>
References: <bug-222071-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222071

--- Comment #2 from Harald Judt (h.judt@gmx.at) ---
Created attachment 310962
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310962&action=3Dedit
dmesg-7.2.8-commit-reverted.bz2

For comparison, only one hibernate/resume cycle. I know its not the same ke=
rnel
version, but as far as I can tell, this does not make any difference.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
