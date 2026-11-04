Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823514;
	b=e56wOG6PA3YyNfF7GuqsOH0OPT7l86fUkvCKUIsP8Hutkzwl/7BVC6xRVOnWXLEXvb+d
	 lD5nfNPMp9mMncVOswUJb8X1JLN0gwHkjCUDCX9hcLm8D5H0MYzukogTrFirYKiaJ/5dS
	 mtYSrKVP3cMQhbLO27QLZpHmLSo2wYBoiIBuuwkYhQ35e7tYRtu8mTrcjqhdidZQAzzLo
	 8CcR2f6FaYghwkcDIysc7waKvRByqQGhe9GQbhCaTOBf4qJ42TdwVrtUib56CLizyC/mx
	 E8gHuuDaQCdNX0B45DDiHpBRhHBo5rQci7DL+mEEByGZc5f9lRtH9hvTT58zv4P+e5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823514;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4rkrqJL1LnRmJoO31VKiy8jAhuTEcwoybHcQLSMGZI0=;
	b=IEWc9WdPbVNC1ahOVbem4zgjtvW4Emw71kYE6/sStWQyvucp8hzA9dJQND6xAoIN6s9Q
	 LQtcSePz/OtrRX0yd0RBk7R+YwZPSbrTfkuz0FZuLxxFk+JosnBI3PsyNl7OPh2atz0/e
	 yAUThaa8LvUq7isOPg5P8+jgmDjQTXNe0HX//uvTNVDCQMjGs0caizUXX+9PGdI+7BnAN
	 kQBX2+lpuRGSCju1a1cse/tf67J472KIRzbsstTxnbEIGmMRQYq99y09vB17hkrcH5NeY
	 dFPEnCEnbApqNqXX0ygOpIe2T/NaSFj3MusPY09Td/4SbT093k/ipGbE/qkQyptCQSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBCO6QJC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB0C6071A2C
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 20:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBCO6QJC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEE11F00919;
	Wed,  4 Nov 2026 20:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793823513;
	bh=4rkrqJL1LnRmJoO31VKiy8jAhuTEcwoybHcQLSMGZI0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FBCO6QJCWQ44hSnk2c4x0OCPCGG7v7jCOXT7P3pO43rdbToaZka+LQzVSeORtXKZp
	 3C5gombNedXn/ZgBChCn1yli6ttUTUl5B1UF6m2DfNjlkDyEea837Qe2jQ+w00dCN/
	 HRi+kIbPs60Iao60sV1LqsYeJmQQmUNSqsbG756MrjD92Pei2nKvTbEAy6tQjD76fL
	 7BP19cZjpqe1eMPEAZ5e6hzy26eIVS2PyO+k6VHPeckvoAxW55vP1sAesK8fDeICXo
	 ktaE9Py8vhbgVgd5QnGUIpsv5mxmpO6gvRyP5SGymdzQ5wvn5t8V77/xzENGqesKkC
	 GBc4QytLYq2Qw==
Message-ID: <sashiko-outbox-198000@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] ACPI: glue: Rename struct acpi_bus_type to
 acpi_dev_type
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <10966452.nUPlyArG6x@rafael.j.wysocki>
References: <3471545.44csPzL39Z@rafael.j.wysocki>
 <10966452.nUPlyArG6x@rafael.j.wysocki>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 20:18:33 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>=20
> The name of struct acpi_bus_type is misleading because that data type
> is only used for ACPI companion lookup for specific types of devices
> and it has nothing to do with buses in principle.  Moreover, it clashes
> with the name of the acpi_bus_type variable (that is a const struct
> bus_type) which increases the overall confusion.
>=20
> For this reason, rename struct acpi_bus_type to struct acpi_dev_type and
> rename the related functions and variables accordingly in all of the
> code using it.
>=20
> No intentional functional impact beyond messaging.
>=20
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/3471545.44csPzL39Z@=
rafael.j.wysocki?part=3D1

