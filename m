Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823620;
	b=1hjUt4wnBvAUjMeMGQFW+U4VhdRwQAYvKqlAiJ/jC/O7ATP+8rqiRDWgCfADWlnsiSE5
	 7dTczyoK1exxOCAL5sgZUojKDIwVs4K0x6l/B7PkQQXfOR2P8APNiZXqjodwO6D6RtrIy
	 OXbV5LfgJaycYd3EsvO5edLcH3WPgLKfLhxQDCO/MlsCqmSLRL8H4CU2sInMKCFohuu3p
	 f0e40DM21tS73ytvecU2UGwweIakKkDJAR0Lj98Bd5aRI9l4Zz7n6yxKSdgPcII922p2P
	 KiM66jhDdRlnsgcaGEtCArNJB5+iZtCvThxmW/T4vuywhjy1zlGdH3v5JM47CipJPwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823620;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VtJCmsVFHRfMRIHgGIsjOuJcJn+dmV8luHfQ9BL2ndE=;
	b=V+MnmtOlJNpBjmM+v31uBKQON9iRHi1aWzTcswBFgxebZ/yfbRMzh40tAV2b1LVtwjVT
	 jadaCw4jvkNqa2QwRa5kqY7ID8McfPQW5a3SLZlvGFRnN0aNRaidjiw7ptvC/M7pFJWKq
	 jV0swajN9JCTVbYDH9THgUeI3in87p6KsKYocLBtpF5xqPHcv5dPQeahlikuLPTvOpGop
	 Hry3GpbZ0wciwc+por4yaiB5SaHrmlPEF/pyUAaATcUbA3m2/mKYzCY7bQ1Tnr/6L12r+
	 LHeJu9LVDCXKl1OTq/O26rs5FxVn9qX48v6tFjDpl36LPejdRI2SNgG3HzQ5nPXuzVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M95mSREC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1CC6070302
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 20:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M95mSREC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C129E1F00919;
	Wed,  4 Nov 2026 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793823619;
	bh=VtJCmsVFHRfMRIHgGIsjOuJcJn+dmV8luHfQ9BL2ndE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M95mSRECPZH127sT1QisXv3sgMbjkAPjhNxFyt4q+Li34BUwYDrYLWMacHfDbbCap
	 P8XhkrSrhWxI+LRHMY1hDaFXa8gwUdmWBR0uMm4AkVvxT6wt+RHzWtESKYM7lE1X27
	 L+w4F0B7cnlWIfox0upgbk0RIj6F3Gorvp0rmbywTWfDXBrR2Lr0DCVUSFHJiJwLXo
	 o/5BXcO5cfcnjX8Sg1x1LdKJVou3BDg8qtuRnyIvnlncTu7kDovzn3jT0htG1oQsqv
	 Nyiai4jWLRk/JZyaqcryzWO4jbDqw5ow6hTn7Us2e8Af9CLUlx+Guza8lqqImVUOPB
	 STGg8O/vg4pGQ==
Message-ID: <sashiko-outbox-198005@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] ACPI: glue: Simplify struct acpi_dev_type and
 its usage
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <8036646.EvYhyI6sBW@rafael.j.wysocki>
References: <3471545.44csPzL39Z@rafael.j.wysocki>
 <8036646.EvYhyI6sBW@rafael.j.wysocki>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 20:20:19 +0000
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
> All of the current users of struct acpi_dev_type match the device type
> in their .match() callbacks and all of them use const device type
> pointers for that which means that the structure can be simplified and
> used in a more straightforward way.
>=20
> Namely, modify struct acpi_dev_type to contain a const device type
> pointer instead of the .match() callback and remove the name field
> from it.  Next, update the users of struct acpi_dev_type to register
> a separate object of that type for each device type that requires an
> ACPI companion lookup.
>=20
> Since the register_acpi_dev_type() and unregister_acpi_dev_type()
> function bodies are rewiritten entirely anyway, make them use
> guard(rwsem_write) instead of down_write()/up_write() pairs and
> print the messages under the semaphore to ensure that the struct
> acpi_dev_type objects they refer to will not be freed prematurely.
>=20
> No intentional functional impact beyond messaging.
>=20
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/3471545.44csPzL39Z@=
rafael.j.wysocki?part=3D3

