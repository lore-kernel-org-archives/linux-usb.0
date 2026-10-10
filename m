Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9A6253B42;
	Sat, 10 Oct 2026 01:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596614; cv=none; b=kE6OwoKkBja/lsOIN0f/hhzi0XuI/dhe//zX7vYvVSJ0ehDOorBYg5hX124ZfU78zJ8Ll3cwDIjDoHzQUx1hMLPD+S2+3w6VWDdAXU83ree29d6wLeNORUk/IFJXmWkVmIU08pY5YhuPrhJDUU82zsWhgRqKLilOIO/XCsFSmBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596614; c=relaxed/simple;
	bh=Hu6EF8MuZZAgTTrI3yng71js/yaasmDRDqHWDDNyWyI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=robB3osHuHRdBMd1xqQvtMRob672hLloKKldPqVqC5dnrjhDVxcRJdwfVNr/ARR/ImhTmJeDxYVvHT9/Vh2MMPhQ62bnu+mc+T31ZBwtmXL3oTsczCpraHWuMQuHPQhCbSN7KdImU4C2KEERBWHQtUQWhstutlcH5G2qI1TxFbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwp7oagQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwp7oagQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E221F00893;
	Sat, 10 Oct 2026 01:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791596613;
	bh=Hu6EF8MuZZAgTTrI3yng71js/yaasmDRDqHWDDNyWyI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nwp7oagQBfndZj5l4KgsQx3uiE/Xn/Fqo+n4hTmsjywlPhI/7SLz9b16oT9HkPZUe
	 43n+sFsNEGbCWi8MJRrsnJMvhfwoGgK4AXe/AwJACJJ3lTG4DKWLhIKpLslqxjEFbn
	 78JG9/n3JCPCPav7E/W2akbv3vqQZc71//cXGS4So2OT1q4TVE2SD8rJLp9Ow1423e
	 GlLU9YdKyab7P6rSX7ImuxUkASs3Tbo5mzjPKFglg5XvvgVzuw5pB3wgBa3s7nqcK2
	 K63DoQK4kegluufMI8zT/r6/eVQEzDXuKUbwkABDXTEv2LzXkJnxk69M0vygWtZrsO
	 ABG6AckvOHsOw==
Message-ID: <sashiko-outbox-166208@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: tcpm: Allow configuring
 tSenderResponse via fwnode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amit Sunil Dhamne" <amitsd@google.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261010-tcpm-sender-response-time-v2-2-67ea364a21d7@google.com>
References: <20261010-tcpm-sender-response-time-v2-0-67ea364a21d7@google.com>
 <20261010-tcpm-sender-response-time-v2-2-67ea364a21d7@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 01:43:32 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> The USB PD specification defines a range of values for tSenderResponse.
> TCPM currently uses a fixed, relaxed value of 60 ms
> (PD_T_SENDER_RESPONSE), which may not suit all platforms.
>=20
> Allow platforms to specify their own tSenderResponse deadline through
> the "sender-response-time-ms" fwnode property. Platforms that do not
> set the property keep the existing 60 ms default.
>=20
> Assisted-by: LLM
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-tcpm-sende=
r-response-time-v2-0-67ea364a21d7@google.com?part=3D2

