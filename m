Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3A6342CBA
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 00:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786494441; cv=pass; b=GNAFMLk5CRdx2B0Nlw4xlKsWLzK2XiDO+Z5VqquwJ7lof/alzm8YXlvwvSkuARpqROZFTie8Lk5d1dG97O+3lWnfhSfrKqU2QaO2sQaNk4mNZSPQY6k0d5CkUrHF/XofnAM0GL3q8SVTenTLJNbWTknCvCY25w3++mM+WN2D2pA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786494441; c=relaxed/simple;
	bh=DC9XWClquj5GXydGUnkiPapt9YRHjdKn6XNvQU5kLgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0b4ZdpsF0Hr+0rnbwq9swC7h5Ytf5NqzLOPaUi0aX07ABV+SDxFaL/MESTX4yQTObvYkHILkjrlEzBJf65hMCiC3X6F3R3mmQzrpOzVd2Ruhvrxq+iVg3PsA/XmnJWhRSsRYXGi84gXYYsf8BMsZyPUkRecOHokV7CTABi421M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=superbaloo.net; spf=pass smtp.mailfrom=superbaloo.net; dkim=pass (2048-bit key) header.d=superbaloo.net header.i=@superbaloo.net header.b=BQdSQbB8; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=superbaloo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superbaloo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superbaloo.net header.i=@superbaloo.net header.b="BQdSQbB8"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so231980e87.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 17:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786494438; cv=none;
        d=google.com; s=arc-20260327;
        b=ZdH4RwRly2JZS0Z6qE6WNehgfAV4qxR0B71+wbgCCFa4/0IrBtRUsk9fgUfe5irF1o
         gjyrlzDbunhaL6buj4yBh4yD5ki0MBVvK+YCnIrvV7be22KQPRJt3dJVOmQ5stDT5JtD
         RjLBG5isbAf0EN5Xp+BEBAmSS98BBcbX1+klzdjPxbp2sj7pcRKQMg4PG+Q95XrxEKrm
         /esHi5rUvr1c2rwxOHV/V3CQZp8fuBIkL+sa7XQbW/yO9cP7htoY8nDEFpY4VzmHcnaH
         nNJS48Ye+XGSQ3oNhMQ8GOP5Gbp5HO94azw50qg7pRC3yvEU+l5Gb15ENcFTCW0p+Qjw
         8Gyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VPmjvTIZ3uccW5WBxN62erBkUQ6ddD7JJSJUjf67Gp0=;
        fh=UInDXuul0YmkIDFrey9Om3B6iGPBYZqfgfkoD4oY+Rg=;
        b=DyrG3eCPJj/ICL+1e366IKUItxccF+GSGciaWqNGmPfN+YBg/XMrBLOIAoGXif8AHx
         iQiLEvouAbDk+ltFC+vHOC09Q7Bf7QgLj/YFPPp7glH7kWG8I7w2Axs8nKN2h6uhR1k/
         xr3nQPYLzdoYE3OiGNUshWXa3BX/Geks83usHMDb3bEYXRNug4tjnZ1mIkisRdvM5X5p
         BHtFrBfB5zP+zYMmNX9VwTci6nP42ZFyUGFWQSaBnbiEb0rnYPLe40ovQcR3HykfvTg2
         Uoy5Bxfy/cHalhQ8crzJDlePLTxlmUykKXdqFYgOpe9C5V1CuF0v2+gmXaq7NmEOeQga
         jkgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=superbaloo.net; s=google; t=1786494438; x=1787099238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VPmjvTIZ3uccW5WBxN62erBkUQ6ddD7JJSJUjf67Gp0=;
        b=BQdSQbB8iV3Q1OTIPZmXAFcMWsR6IqqEiz9b2Q0ogJKHXxaPT/oqP4A184PLSxyVMf
         /fSkl7fIGbZ5dfWgb5LLpB8B4Hw3w5OQNzBZP8e5pI1yq3Jw6dkrc6I1JepI3WbhDRYZ
         A4UK1DrUHsTRgiCkkibMbEIJFeGvm+F/YKl0lPWxNxtJXFCTKIs2d0Vk0j7BHA/1IOIV
         IMwsV6vd5Wl5WyhGIewJA3hHqYcUmySemh3sNfQMFUh5n/igz831aVr2yiEiOgdH6SvA
         F7I4F/YlKuq1XKbpp6AAb94z1XkWFApkByGHTa4TcsEaehw2E7OSHyEcRZRFpbYDvbZd
         Y4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786494438; x=1787099238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VPmjvTIZ3uccW5WBxN62erBkUQ6ddD7JJSJUjf67Gp0=;
        b=Z8DWuDjEZVkgpInuLRiaCGnM6CoYAjHeo5dz1SP64WM0QWVwvgsszQrMIBWROIYPXW
         YMQSTwbC7UrX3V0bRlGjnxxwBJraRLl4M+F5EwTZO3mhUES82GZ3UOzc2XT7FyL5TShb
         EE+xoeNXDb7a7Rqd9iBb5QcQIbjJUhRh0Ar4cVcPz6oeCBzGBKPMZ5HbpKJYF961/u5P
         IXOD0zGm3jHQIrSTrwPkMxn2/SD+ugk2thNl3YEQ8vWRVafSKGpWJqkeoreqDXHc1A9O
         YGRPzsGP0Q4z+dNvk/3ak6o+BIqH0cSfpSGtqOvVZKJPfoZa7YzYiF4KUDyEG9rsa1IK
         VtIw==
X-Gm-Message-State: AOJu0YzCr1VLmvYTO+6gnDee7YiBBM+0P/EOO8kt5977whdmfNMT+Zpw
	/jMmkPRQqJjSRhdrqVwtYNBoMGXK42gyO6M8sjwhMdDnj8jmWK/eC6xuaKO60nkDdHK+iWsG2xg
	XS1DpTwPKfDe51jyAws8s3DOCo1pYGXHzCEjPOdyQcA==
X-Gm-Gg: AR+sD12oYacT/2rYXmUxJ66YKBNwxD93tcWeBMVcVuMaO/M8cqFvH8coUnBRDS9ZJA5
	jjte6YGbjk3gIfjbVd1Jy1uuhsc2tPTHTxNbxJBRYlyxnqVQDnFZ9sxgmBFhJu29YRNQcN1PzcC
	mBsUXgxS4OB9Jvj/G5j1/kGsYfdqa9FVmgK/uvi0ZLKNpIjb6Nm9444bLqWw7I06Es80l+K7NjH
	gxLjdg5eBNvfblP28P67Y8b5QKzgicXBQwaez07j9D6z4OzZyJQLUUq/QOLpwHlx4eny5UKuEFj
	odkNlfH0uF23wM1PyPw+iOuO/Mw9YskuF1mkJ42bc5M+Z70cnXAc8BWndyR/zdM8+tJ+MnlFDeD
	xLzXgGngQ/xsrId5BPuR+/pJ4lzEElQ/ddvMAJpEwdqzzDH7cnwGnnKt/7QPPL5j9nxA83IBHXs
	M=
X-Received: by 2002:a05:6512:31cf:b0:5b0:13e2:4b2b with SMTP id
 2adb3069b0e04-5b44e334dcamr147272e87.52.1786494437610; Tue, 11 Aug 2026
 17:27:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811033508.1050148-1-baloo@superbaloo.net> <20260811104237.4500b578.michal.pecio@gmail.com>
In-Reply-To: <20260811104237.4500b578.michal.pecio@gmail.com>
From: Arthur Gautier <baloo@superbaloo.net>
Date: Wed, 12 Aug 2026 00:27:06 +0000
X-Gm-Features: AUfX_mwwbQ9S5CnDrRMQIZy-Gj7_vO2BrsVRcijhK0tgO7pmoEIt2UftoQ6OSCA
Message-ID: <CAOAHwbUGophqfWvJw=u4YuYkX==vm-UGv5cZS9brbpZgvs3M6g@mail.gmail.com>
Subject: Re: [PATCH] xhci: fix lost bounce buffers on TDs spanning several
 ring segments
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 8:42=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
> >   device-mapper: verity: 8:2: metadata block 10850 is corrupted
>
> Quite nasty, and not everybody uses dm-verify in particular. It seems
> corruption could also affect rare FAT filesystems with tiny clusters.

I've triggered it very reliably via the dm-verity prefetcher. For the
last 6 months,
my workaround to the crash was disabling the prefetcher, to the cost
of performance.

See https://bugzilla.kernel.org/show_bug.cgi?id=3D220861

> > Fixes: f9c589e142d0 ("xhci: TD-fragment, align the unsplittable case wi=
th a bounce buffer")
> > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > Cc: stable@vger.kernel.org
>
> Note: you don't need to list here the driver maintainer you are sending
> this email to. And no need to *actually* send email to the stable list.

I didn't mean to CC the maintainer here, that CC was for the author of
the commit I was fixing.
The cc just got parsed by git-send-email and sent it automatically.

> > +     if (!ring || !td->bounce_seg || !td->urb)
> > +             return;
>
> Tiny optimization nit: !td->bounce_seg is by far the most likely case,
> so it could be first. The others guard against bugs and "never happen".

Noted.

> Hmm, AI patch? I think most people would write it like below :)

I used AI to walk me through the trb/td logic I was unfamiliar with. This w=
as
a copy paste of one output.

> The code looks correct, though I would do it differently: store the
> last bounce_seg and run the loop from td->start_seg to td->bounce_seg.
> This avoids adding the 'if' during enqueue, and still works correctly
> if the TD wraps around the whole ring so that end_seg =3D=3D start_seg.

That makes the patch significantly smaller. See the V2.
(https://lore.kernel.org/linux-usb/20260812002554.1166712-1-baloo@superbalo=
o.net/T/#u)

Thank you both!
