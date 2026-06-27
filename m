Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFD91946DA
	for <linux-usb@vger.kernel.org>; Sat, 27 Jun 2026 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782556781; cv=pass; b=ZuCog7c1tJ7F3+xWYF79qsIRnIgKUof8A3WyAWRmu2UDySY9QJrThp7ILOBK9pkOmmeyV/Wm89cISYiDtGjB533f+AeOBJI6TGdBfv18/fk+6zoRsY/J4kporPeDZMTAw025wLUtswNBVqJUZWCAAdxBOo2/6xdyK3o3BO+nedE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782556781; c=relaxed/simple;
	bh=y0DZJwtDtEhghSBktd9l68Z0/z93dAVJRUHJFNsOOro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDwlYYf7k37kbQc5+Cfnzcvwvu4muzkwbGu9b/OGThxc0YYTJFeFyQp5TZE5QStHJNOOixb8+yodg0XCdFTdo45N9W0Mw6nNbtvoO5ZXAYSEfqbx6b7bJNRxtTPJUex9W1pZ4ut5BDMzlMBcyZymRR6mozcqrlOg2Mi0Awe4QBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DofrcguE; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DofrcguE"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6647bc8f900so2180726d50.0
        for <linux-usb@vger.kernel.org>; Sat, 27 Jun 2026 03:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782556779; cv=none;
        d=google.com; s=arc-20260327;
        b=cz068VOs3rZp+AupR88hEDusBdi8fveqQVziD/DvYUBsVpcYBulXyU26wIDjbBHOq1
         d6yhomrVGi2xB/b16nQPB0Uo6Qalpv4VzBhX+8PoktfYWUbkUShAQZ8nnLFGrU86q/RJ
         5YB6RVwE+UjvUz4B9QkSbEPXHoP+AcGsx4aAiZD4tvirmjZUqBUkVYNuPv1ifUgk6pAA
         xEqkVpTW0abVAmNYH2XDHs+rYqBKolyZaKW8Xhrrc+BBVKn1dE/D5LJ0webwv3GLE5Ce
         D5j9/dOUpVhfwiES81aOHUbEo3AjHZc9lL8HzigOUYmlcIchd6YQvrvkrJFJjDxIz5+x
         wBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y0DZJwtDtEhghSBktd9l68Z0/z93dAVJRUHJFNsOOro=;
        fh=x5HGY3Vb4iPu39SSI4SY5gTMTSpWqAi3W4DMI/znGoE=;
        b=oz3FNKBYr/5X5D/Ss6VxezpETn7qR8l5wUyI6lwOAPbUbMmOkxKS4Ycf+0yH0wblhk
         sxrslRCEKbjnqmp9Rev85awgQgmjPiBvPYwSDLbAVZhl1M/+Nq/0zYntfmblGRByVsab
         FVbq0hqyL04ejEOQNKa79rhCyZzKhv5oGqUTFrpjNXkPdthmh7oy10arKQ8uqijb+ONW
         PQ5GxojAMXbC3mn0Cs8zPyE7Vlhh2ewTu42AFvbtC+NSoGV5RMYSL9q5vqVx+1AiXsR7
         i2nkzyqf/cyqjDtIffUEGhHdOFdMY2QiEPc0c9CjJ8k9AWvWSciWSx5+c571jOxIeY7a
         D1Mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782556779; x=1783161579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0DZJwtDtEhghSBktd9l68Z0/z93dAVJRUHJFNsOOro=;
        b=DofrcguEIsRMQ1BwBplMZNpUYCpd1tTCJFY0B0Bd9lqouf8HHCkYxURC1sq0mtOK20
         scrVUGTqGB67tIJAyivPBtTZKOo/Z/+Qn/xDNKqBnL/isPMAbydE7Njs8xCqDFKTOJ9b
         H7N/mcwFEkN6saMafeKXL6mPOcFRHiJwmAUkYeMtr1Lmk0cJv61Yr0y0+/mKE3QAI9dP
         A8YXWOhM1KPVr5nSz/ODXOWHbH07qSDPgwF1WG5xEQ5KzNLi3ed6wghPmarmFeHqAylJ
         y6JyIa91NDIZuDbby5s/BnygT+QdlafQcNBW0SMb5R/xFB1d87ctxmTq5bpFgqXjyYYg
         iQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782556779; x=1783161579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y0DZJwtDtEhghSBktd9l68Z0/z93dAVJRUHJFNsOOro=;
        b=K6B7NCBgfz27QybTwzubgsq36fHLSQQLBmK/ZmsRSoLrQ/1jl71ezYkoM5cCIQJ2zs
         8jy+0lVBXx8RCyVdwsZksVdjlj22cXcsuMQ0lHxBjcJoQ8jboV9K7wmuDt8h6MGAgh8E
         6P0UwkZH+T/ggGlmCPOMGohjzfX+kGLSN0iaZwP3fqzm0zp8oICdc08rsZiLXrhrJWoF
         C4ieaT7vTLzKKiifxpYbraw+JEB5rdZDlmuMB8gyRdmoyYwtwAhlLFrji0q+FKcoZxHc
         OAtaXbaNo3vmrY7H4GnUZh8pVLBeV328WbiGoa9E1k3WMPFNw2MAIpa+5aAwnr2HFigG
         vNhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSCBDdIIRIbdrUCTHvk+LgP7i7W36PrdfUns/38TNK6tLBxZCErlSErOnzHoahEqUTPEs9GKRXnSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJzCLsioPWUvpEF2QBPJliAS+I5fPxBUnnf4xxS6pev0Jf+jA5
	wc5PpbZD0ATK519+BcDvydIjQA44eoeJ/lqWNMszNSqqT6PKCdbjsZ7MCcSPEQRiACfQHgzP034
	aaIhsApoWZPCFCmDAyWnb+OmoccOt8dA=
X-Gm-Gg: AfdE7cl4A8oTYhnivVKvuAMBDKiQgAHeZV+RsIrCq0fkttNNsK8nYvn7l/WVBR9T3f0
	istFuOkDtjmn9gTkVZ+PefDYnNz1nAXdaFYuAya/6Feb0wjUBDH6xXfPYJpLvz7OV0k/2xaJJBV
	Ykn7gjtszlbZBvjFAY7bGD18HmZRZm2bzAMBmf4PHBYAZECSgx4S4hA0TxKcDSflxJIQ56oi2Lt
	jIyEeQL51lx7mYUwb0Ny0dpMvHnjWKtNBjW9FvHBdhD9MCFQ1ve832sQGgOzNahPIv0ZmOkAjc=
X-Received: by 2002:a05:690c:4a0c:b0:7f9:2c1b:764f with SMTP id
 00721157ae682-80a6b897d1amr94314277b3.50.1782556779069; Sat, 27 Jun 2026
 03:39:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623015211.4111938-1-zzzccc427@gmail.com> <aj8S2btHtbyjvbCB@vbox>
In-Reply-To: <aj8S2btHtbyjvbCB@vbox>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Sat, 27 Jun 2026 18:39:27 +0800
X-Gm-Features: AVVi8Cf7iFkpLbEl8Nxp---kRLvJaX1_MTj4vKRuIhdSP654Yp_UeunbPTQdntA
Message-ID: <CAFRLqsWQSyhn_p6iNHtzvgfcDvHp5HfTTAbez=xzpJtaingGrA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_tcm: Cancel delayed set_alt work on teardown
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiasheng Jiang <jiashengjiangcool@gmail.com>, Kees Cook <kees@kernel.org>, 
	Mike Christie <michael.christie@oracle.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"baijiaju1990@gmail.com" <baijiaju1990@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thinh,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> =E4=BA=8E2026=E5=B9=B46=E6=9C=8827=
=E6=97=A5=E5=91=A8=E5=85=AD 08:08=E5=86=99=E9=81=93=EF=BC=9A
>
> Couldn't a race still happen here? I don't think you can just use
> cancel_work_sync in tcm_disable here.
>

You're right. tcm_disable() can be called while the composite device lock i=
s
held, so using cancel_work_sync() there is not safe.

I reworked this in v2 by using a small delayed-set-alt state machine:
tcm_disable() now only uses a non-sleeping cancellation path. If the work i=
s
still queued, it is cancelled and cleaned up immediately. If it is already
running, it is marked cancelled and the worker owns the cleanup before
returning. cancel_work_sync() is only used from unbind/free paths where
sleeping is safe.

I also added Cc: stable@vger.kernel.org as suggested.

Thanks,
Cen Zhang
