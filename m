Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBB6368D4C
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 16:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791305204; cv=none; b=hzjQ6HyIMEaGVv2X3UBMvexqIwsdSGGFk1EMlT3vCBlC6lVLL4m5TSPClUo1ViFZ7pN6ornFkeIFUocgmHsXfMk64DUnYJ0z9wSXnnoUJ4UCYxah0k/kzifsRZpFLwLXkXEJmlAEAKfYjEE/WwmglVRtwW/Y8LwegKyG0k9cO40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791305204; c=relaxed/simple;
	bh=H0FtGtU0e35/p+9YTYpiC0BSpntc0QaINUbmo+pUqUs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AfZys91biKStiHMhOCPkdeABmoYS3cXGiNrnyCdNoKF+l1JbJeYulbA0XK78yug41myP7uCR4iLHTZ8Q9qEtZoDX1RU7DmOkjphDBvN8CFNxXo/gRrTh3GZyRWBz7WV5CD6qrgr+RfoJLMITSqt42lm02QZmr7E5K56T8rsWqNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hP3SaufR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hP3SaufR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01661F0089B;
	Tue,  6 Oct 2026 16:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791305203;
	bh=H0FtGtU0e35/p+9YTYpiC0BSpntc0QaINUbmo+pUqUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hP3SaufRPN3GwR1QymN4+hdVu/SxaeAtdASvgvewldzfv1NkPdtVCxhj1G5UI8Hox
	 DSswaKkc7umZHP1WoX/lHK0IeaR05TSqCpvLheZZrz2yuSJeXafErFXTHs7yOEPIbG
	 ZEQchH1BQaeoVtkOqDt9LNwAJHQXOudb7gJ/7oLfx9vjQcE+tJKa4sih0eWTvRmaNS
	 l6dqzVAU7Hv7GH2yYy8Pq+RauJL83RhwL53yG50aX01BFXu+C++HvSbimxWvEKiDtS
	 sv7uVPags5x+tCuKSoHERbD6s6GDgt39Y2L/bc33O1Y0L3Rzs/w1AN5aZl2lmhaxKk
	 KJ4Ixka0bnfzg==
Message-ID: <sashiko-outbox-162268@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] usb: xhci: correct variable size conversion
Reply-To: sashiko-reviews@lists.linux.dev
To: "Niklas Neronin" <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006152427.3735383-5-niklas.neronin@linux.intel.com>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
 <20261006152427.3735383-5-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 16:46:42 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Variable 'ctx->tt_info' is defined as a le32 within the 'xhci_slot_ctx'
> structure. Correct the conversion by using le32_to_cpu(), ensuring
> proper handling of the 32-bit 'tt_info' variable.
>=20
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006152427.3735=
383-1-niklas.neronin@linux.intel.com?part=3D4

