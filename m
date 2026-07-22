Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADFE440A34
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 16:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738865; cv=none; b=I4tLQ4B/iNAmXEZuqD65WLCDDbtq6AFV4mgdxI9XcD4DApYxFgt4XCCAffB5dwGpWiWjndFKwtf3zofNqb1djiz8taAlcvn/fK36ptYoGEhpJtCvMC2VtHgURjbm/vyeeSUW+ZEDZvJRox8iaPgISWyNr7ZvQrmMrSjU1gYT800=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738865; c=relaxed/simple;
	bh=CA1zMW/l7hmfgVyKHm3BudesYs6Cdqa/DeXdZgNM2TI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PQZGv3Bvj9W1TfIrVuVONwgrraWVa0m3sXBnMb2qP30eqxzvCakdVvbgHS9YXFLKv6EEPDidWHfAUZ7oOY7cNk+6H7R3LPlLHy1kfk5RygzMPO2F51go22cmZe6yeWbfMZxrfkjG9EQWK6cxQnkzib4R7EyC3dmGzXm/gCEbSzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKsEgmve; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKsEgmve"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C37CC2BCB3
	for <linux-usb@vger.kernel.org>; Wed, 22 Jul 2026 16:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784738864;
	bh=CA1zMW/l7hmfgVyKHm3BudesYs6Cdqa/DeXdZgNM2TI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UKsEgmve7DhYXO3QOKtX09WcR0M22DnrWwX8HnUhjXJg0ae06t5NKh/tSYfl6rsWp
	 nlIoqlQXn3xjeQ6pa1uRNmq3LUUB1wBSOgxTuiSDkjwidKrAn8BkN3hR2iNCR5s9oj
	 v1sgJmQO4JBNwNiECPS45gDtLG0p63DZmmLWEP5NAJZCOVagDP9SQAWYrFE6iNQiYW
	 s48TfZ6+hfNaiHZ6maRNBhipz5EpK2w0iN0r+CNGR7OhAyss/7nK+4trQzOvbi2Z7v
	 Y5CkjiTXCobjYCY4CWb3saW2vFAj8tnyDjZKvRC4W08Ixk+/JXbCnFHyeTFc4mYtFE
	 3XwKMaHWNwvGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DCDBBC4160E; Wed, 22 Jul 2026 16:47:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjE3NzhdIFtSRUdSRVNTSU9OIDYuMTLihpI2LjE4XSBB?=
 =?UTF-8?B?U1VTIE4tS0VZIGtleWJvYXJkICgwYjA1OjE5YjYpIFVTQiByZXNldHMgfjEv?=
 =?UTF-8?B?c2VjIHVuZGVyIGRHUFUgcmVuZGVyaW5nIGxvYWQgb24gUmFwaGFlbCB4SENJ?=
Date: Wed, 22 Jul 2026 16:47:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: m.langas55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221778-208809-JFfRuVMup1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221778-208809@https.bugzilla.kernel.org/>
References: <bug-221778-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221778

--- Comment #1 from Miguel Cervantes (m.langas55@gmail.com) ---
A note from me, I did write this with AI I'm not sure about the flow of thi=
ngs
yet in the linux space, I have to admit some of these processes are confusi=
ng
for me, I just want the information at the very least out there in an useful
place, I apologize in advance if there are obvious errors/things I'm omitti=
ng.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
