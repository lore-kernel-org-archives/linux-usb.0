Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA6B3B3BFE
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909923; cv=pass; b=ZGJnw2/UwQwRH9YaudqhwaUis3k5ZCxP1rdm2K1LPIk8cKqKZpe4gD6KtUvjj1pWnY5clvTUSKPWUWGo8DS+b4mKi+pZcq3Bvq9CZJSTSpcQEZpSN1cC7jVl+zk8nbkW/1CvksB97yFSJxscgvdGxEqmgfoK0aZexSaOsqr9R+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909923; c=relaxed/simple;
	bh=g6QNJFkv6IlGascc0FjOpWGc85Q3//n50YZG1Fc0EeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FS31vWvjTmJktRWTJNtlv6gpeVa/XEyMA1vKAzDrJYSpI9HU4/0fxA/LrSxJyuGj/r/52e+16EYTWc144DZoYft+MdtZPJ1wL/aqOn/7rvInq9M/4p1f8la7eFah/PwZHuN5OZ9687IoC74eppgVriRPXhg3i0mw1eWoUrX9MGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGsGNnzo; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGsGNnzo"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so2723607f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 02:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780909921; cv=none;
        d=google.com; s=arc-20240605;
        b=Ivyhb6HX7cj3VSb/VqClg9WDIoJPO1DK0bONiW2PmJ0OYMd+esgseO9b7On1N55ntQ
         MOh93kSsurt28vS4nzPmK+aOia/vMGAiwC3DWHzyp2OjZ8/Ubzc1TXtxvaVcrwd5cP6n
         SU8LaTTmmKwGb4sSEuYYPbviovwLkRqBtLfuOtnW05cuB8ksenVWw146I0eLfpHIY3JQ
         HiLtN9EQNNjDQsZuOpRCtbLlTm7DwanCF1jvHg7uoYBzvVc0LmuzG7bAbXpBAgkNn+0r
         f4qiPpwp1lDueUnSHLpTbV5WVUGTOZFwHlYqnvdzQvZKZSkYQuetrDPmSgqiviSnRgIw
         kAcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DKFV4KkC6COWNrZ/xgUNGbwVmIaCHTzuBxaE2v4BzGc=;
        fh=Vg+WVePQ/WcrQosgGBIlDPiaIFuwwFDfaBWnbJTlQA4=;
        b=Kn4RnuBGLgkxKYA0lY+93J70cJiAieM9yUEQZX5/rcnrUtVJNMp5XvKIC3SEdxNcjP
         KDBJuUwRAj46DqD+Or6b/X3sFDoSYldXsqPoHJgqKBWuS4XuPgRX94YMCr8eK8rzRdnG
         DWIEQCWAEq4sQE4fHdBcQwjlFuA4DNr1dFTRpI5zHqMQIbHuFjcfHHfXPPMxgDtSL/F4
         2WA9pHlwY22GW22XDxbZ/+RYCxMWZrMgxSXVUL8Zq6hvXcjBJfI3hTYARnya8IOWzohi
         MaBaAr7Yf6pt8ou9hp/0rNjbJPAOsIhuVZVO2fq1630Ve02dO8bSTMc4CT81HSt6b3he
         Hjlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780909921; x=1781514721; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKFV4KkC6COWNrZ/xgUNGbwVmIaCHTzuBxaE2v4BzGc=;
        b=AGsGNnzo9x56J3OXNY0peJwc8cObv74QdmdzG78J2iWHb2Xd51mycOTRIo9y+rEpLL
         zD1x9KK1sGSilBviasbJ3mmZrRVMBqSVr9qPy3ykSHCkHKXcBC/b8ep8lLSLL5Mp8zs4
         sJfFYkrxLpLatwlr7FRwJTZWyhUwRv0jtz9EOiO6SnWhbFTY46q9/JTdoWREP1kanclD
         qvWgVBxBkpum7Bnu+/geQS5vDIrO/DAi2Uz+Kl5MdGnpxSSAq9YeUE3w+d/1VUdx8LJy
         y2HrCScscRE8sH8LT+o04W7Gd6CUnI/bc1kM0yjpPtvN0UgmEN6Rq8+cTWlXgOfZqc3B
         2J2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780909921; x=1781514721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DKFV4KkC6COWNrZ/xgUNGbwVmIaCHTzuBxaE2v4BzGc=;
        b=XWwmiVqRNgpSlcpoaAKn3cTOiAPSTa4NYMLfJGWGHKR8SpQm3oPLyX7VmFtdkScRYc
         9O6byyLrz8/6lZZRB4KnpeN01wH5s5xDmvtqT6AZ5nEjAWmSh8AwAyHTwpansB45VW4J
         F4Ps1oD4lL8kTruIEdMaVZ0roGSgY6vIl4aCGnAY0E+sT1HNxaS8m7z8JdzQL7BKkGyf
         rNSONXgtMT3SLINlM2+jLG7za9zJ6mDDAL1ae9OhsVLBKFTMM5XIPjEnTVLTpi3GqkOE
         2GJV+r6tIHDnMP6x0Qk/Wv2FsiBC6QwtvbFWe8fo+swD9qRm6f1P/aYo0PBseMBIwGWi
         UeTg==
X-Forwarded-Encrypted: i=1; AFNElJ/G2WLXY1JMyUFKg8zk0pIduNjsGGHVPXqMgRtefaCdxiC1HyTTkTpwnou2LrZmTbn6Oct5RAjVpkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6qAGndj1lM7y/wl3mVIrNLHTnSWZH6uNOE21le0/2IEsGDZTt
	TDcdpf3x8D48seeMiIRixREIBc9Bt1QjZ7ejBuFkJZLqRevVy5YT4b9msCD2Aq3IPaxitFulPwr
	uMEuqc1nBSuIqc+vqWac4Ubylea9tkJ8=
X-Gm-Gg: Acq92OFlUND31GGLTDbly/Z/utn/x0U+BPS/dXAxuxCImPRatyE2U2vxqFyKkaf1cxj
	Pb2FXeC5ojmOoYA/JnRydstSxRILhcdBdxfehbDsa7Xnci8RsspM6iSy7LEw03MybUJb+HOwsiZ
	VV5rp9tmwU5NXWZHx0xZT3B3kv3507YQcw9IbXJnMHs0qyj8sEzjVSWCFVMhgS4pCBapNmhFcys
	gfjyqnFkna7b4Xl6eN1aYjyszV24d8eURSP4877ogDYAVIvQhsdqfMS7P9X0UvUp069I1nzygHd
	JOq+50pWghk+/gxwEAwcj2o3rWnG3kDYlARzay7kPdGRS/bSaPY=
X-Received: by 2002:a05:600c:674f:b0:490:b4bc:4f3d with SMTP id
 5b1f17b1804b1-490c25b06a1mr230055115e9.18.1780909920408; Mon, 08 Jun 2026
 02:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aiZiZy8a0al7xVXe@hovoldconsulting.com> <20260608074931.5911-1-sammiee5311@gmail.com>
 <aiZ_DJGvrmotkM3J@hovoldconsulting.com>
In-Reply-To: <aiZ_DJGvrmotkM3J@hovoldconsulting.com>
From: Sam Hyeong <sammiee5311@gmail.com>
Date: Mon, 8 Jun 2026 18:11:48 +0900
X-Gm-Features: AVVi8CfxVZIX1PxJbVJtzthThC-GPmY30UFKg1hngZQYial9sUn64L8BAAVvloA
Message-ID: <CAJciObGR+joLEEgj_ProZa4i3TmVs_RB7OHP3T=pW2CDkSu8+Q@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: kl5kusb105: fix bulk-out buffer overflow
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan,

Sure, thanks! I've just sent a v2 with the "Assisted-by" tag.

Thanks,
HyeongJun



On Mon, Jun 8, 2026 at 5:36=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>
> On Mon, Jun 08, 2026 at 04:49:30PM +0900, HyeongJun An wrote:
>
> > Yes, I used an LLM to compare the custom prepare_write_buffer()
> > handlers in drivers/usb/serial/.  kl5kusb105 passes the full "size"
> > to the fifo copy, while the ones with a header or trailer, like
> > safe_serial, reserve that space first.
>
> Thanks for confirming. This needs to be documented in the commit
> message, see:
>
>         Documentation/process/submitting-patches.rst ["Using Assisted-by"=
]
>         Documentation/process/coding-assistants.rst
>
> Can you send a v2 with the missing tag?
>
> Johan
