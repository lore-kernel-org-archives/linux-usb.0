Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454DE44A414
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 11:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459615; cv=none; b=mWS8RfY2COOpkGVAtWmDq+V3ZboAxPO64rXt9gCergb11/7Hva9jUai7IhEtiA/AzCESFPU0FHb771zu8KSeXrcaOvzdpBUgvj6n+qB2XWBGKH6Drzrb8hwsA9Q3aj/udgbAbCHmQC/ruVSUwEM6hvxbOtG8FFyuy80zRyWnQbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459615; c=relaxed/simple;
	bh=w+6lDI1Qdp45eY1+ujKV7Y2kAPpuOngPfpP+D5LWtcE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=c85d5jt/uS1eLhoSMlY5IvzX6zVjTY2FhHV+3AljkcfSPMReV0cnCR+CCsNKHMDuTOLq524y0FkGOh2/iEjOJ2u6flqPtnkjgrt0F0IcNEHsq+347HGTD1frnxbwLzTVRTmuX9RXmpfRrKxB1LRY57iVkq2+0DI8vmRqqePalwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D284tFuf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D284tFuf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30331F000FF;
	Thu,  8 Oct 2026 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791459614;
	bh=w+6lDI1Qdp45eY1+ujKV7Y2kAPpuOngPfpP+D5LWtcE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D284tFufNMozbny6Xlpmh67F9goApnyKwzed4In8MpCsCng4d+cw4ZwXU/CAdHUuN
	 E9srAM6uYGbPWMQVa0sKurBa6Fz5bgNzX0ReZ5O15zTRrkeKL+ZyzPrF5FzbyNaxka
	 jVJV4MWCjUhqnta87kyD0O7XV5cbMeW3G64no5jujeGjvRCCpY6ym+zXxiYczNZEtb
	 N2Kkr+slAm3WLAm5TzRC+NGLfd2vNybWs0DiOzLaiVT8ZVtJvs46HcYvwAr0zg/0AX
	 ymTxYwFnqUazlZTHgQ3GdXcAM86Vxrp689H10V99TQorCWodAaecxxHB9C5B6KVpO0
	 q7ZeqcbXm9ejA==
Message-ID: <sashiko-outbox-164099@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] docs: ABI: sysfs-bus-usb: fix typo in path to interface
 file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zuo An" <zuoan.penguin@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <aseApS_MWoP3Jtp0@gmail.com>
References: <aseApS_MWoP3Jtp0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 11:40:13 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> A path was misspelt with the delimiter between the USB <config num> and
> <interface num> as "-", when it should be ".".
>=20
> Signed-off-by: Zuo An <zuoan.penguin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/aseApS_MWoP3Jtp0@gm=
ail.com?part=3D1

