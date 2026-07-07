Received: from mta-232b.oxsus-vadesecure.net (mta-232b.oxsus-vadesecure.net [15.204.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A9014A60F
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 03:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.204.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394601; cv=none; b=ARlz2lhT7/vum9FJE5evxK1HMtnGoAhz/g87PeBAf4Wqy4S4FlgJWR2tiQ9MJm2SGYWJV9b/tWcbBA3cF/ZY8CEehyGQWaPTu7RiaqRGm1C2zcP87NCmPc5LirN1XqfFz0M7iWeJWzLnDkDR+RvegCHrq8Z6wo+BVQI3nNN7tLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394601; c=relaxed/simple;
	bh=fs876EjrSl9Y/9TyRzBhwj2+6PXx2FviauhGlYLZS+4=;
	h=From:To:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=UZnblMzKBztJWJ21+NvhIeM0bvTSEhQfQXrircuyY6kCVcQIaHSxOGIpREagLb18K8qXCrpl8OpkI304PUysyaIJmH9F3u3Lr8v/WWy+Wtl5Ng1FwUonJMcotAFs7PXzazMpdMS1qZsso27EHHik17vw0q8bObLqM1idFL/CkCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=synergy.org; spf=pass smtp.mailfrom=synergy.org; dkim=pass (2048-bit key) header.d=oxsus-vadesecure.net header.i=@oxsus-vadesecure.net header.b=fvQuU0dF; arc=none smtp.client-ip=15.204.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=synergy.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synergy.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oxsus-vadesecure.net header.i=@oxsus-vadesecure.net header.b="fvQuU0dF"
Authentication-Results: oxsus-vadesecure.net;
 auth=pass smtp.auth=4@316323 smtp.mailfrom=dave@synergy.org;
DKIM-Signature: v=1; a=rsa-sha256; bh=KzIZhMIqVW/B+k++/NXrmclufHdAKrSWAmBkNF
 GYY9g=; c=relaxed/relaxed; d=oxsus-vadesecure.net; h=from:reply-to:
 subject:date:to:cc:resent-date:resent-from:resent-to:resent-cc:
 in-reply-to:references:list-id:list-help:list-unsubscribe:
 list-unsubscribe-post:list-subscribe:list-post:list-owner:list-archive;
 q=dns/txt; s=dkim-202410-rsa2048; t=1783393686; x=1783998486; b=fvQuU0d
 FMBcnixnU1uegkbOjsqBCkiWQfgobhozpcEswCzL0j0hTZgDTlEbYjfFLVoypm68ki7bpeg
 ckgRYeieJUfx9/8gTxXgMVkY1kTYoNkG5OD8ajmN/9Ii6D056PDcGAzRv74NNj9QpeOFvju
 Js6EhKklhEJd1z+pGTnWC32hqXEvOyaDEHLL6xMhxzYOUnqfn3vqIme04YvSlavBDI4duNV
 KJe24Pwzj81SBKjllfYG+AsDUGKh7tllB5uZCEqOo5X9kKJSmCKapyEcDmdkG8y+Byg0fS7
 hRJOIZq/LRNC6pEF8oqBer6WmrbtZk3oEwp5aTScwFVTq2vMaUQ==
Received: from proxy-6 ([174.165.77.67])
 by oxsus2nmtao02p.internal.vadesecure.com with ngmta
 id 44942575-18bfe31b919f4b3c; Tue, 07 Jul 2026 03:08:05 +0000
From: <dave@synergy.org>
To: <linux-usb@vger.kernel.org>
References: 
In-Reply-To: 
Subject: USB Keypad
Date: Mon, 6 Jul 2026 20:08:01 -0700
Message-ID: <002001dd0dbd$d4269020$7c73b060$@synergy.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQM8UGBGXKfLag7g/Fp4z2LqhLbr+LOi2g2w
Content-Language: en-us

Excuse me. I have never sent e-mail to the Linux Kernel mailing list before.
In reading the protocol, I think I should have sent my message to this one,
instead.

Hello,
	I am working on a mobile device based on Raspberry Pi OS. I am using
a USB keypad to navigate the UI of my device. I have purchased 2 models. One
has 19 keys and the other has a few more. I've implemented the user-space
code to read() the input device. Things are generally working fine. But I
have one issue. On both models the keycodes I receive are not unique across
all keys. On one, the key labeled INS and the one labeled 0 both send the
same code. On the second one, the mapping is even more bizarre. It has
duplicated Num Locks and other keys, as well. The number keys are always
readable as such, but the other non-number keys can be aliased.
	My question is simple: is there something I need to do to change the
mode of the keypad to send unique codes? Perhaps an ioctl()? I do not know
the HID spec. I wonder what pressing the Num Lock key causes an OS (like
Windows) or X11 to do to change keypad modes. Is there a document or website
I can read that discusses this?
	Thank you,
	David






