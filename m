Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F1137DEA4
	for <linux-usb@vger.kernel.org>; Sun,  9 Aug 2026 22:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786314010; cv=pass; b=WbEbYD0++HEUEC3FcVtqSG1bb/jJLIlWontEO918IfVn7bNvRaqqdMliTABSC0p9T79JwTQFevOxlV6qI7p/gB52LuLbcEpUgEzkRullmdHpHAOqghapzr5BLZU9AwuG3BY0My5q8ia8SwOsPgtasd+IMcLUg1qEtOteNE8H0gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786314010; c=relaxed/simple;
	bh=cWPMeSYUVIR58osr9KSz0guF9JaZKJnJsHqjCKeOgAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IPUYfyGLaJDdqqIcQ6qcLFLHBlfeZt4TJuB2P4ILdVaKjRlNOI6ZDUiJuGbX+cA/BAbsldWhvZ1VyG+8sIbl1zbqDEk9z3Bt9HQpBkX8b4387qUHGvZ53nCJjZegk5VIWX6PZlhn9a4XaDE4xOP+l6OZ15+2ATHzs2qIi7KNvNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sq8IBaGF; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sq8IBaGF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4798bea72f9so706167f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 09 Aug 2026 15:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786314007; cv=none;
        d=google.com; s=arc-20260327;
        b=dYvQ4CQ3xjqPXBLjuJZiG8HmmfRG63kmiIVXdR+YfMT/cLAT5BroB4rdNbuWAdBjHi
         5B1b1i0GD9QcK/Yf2/UhFYhf4O03tBxvScNJ+RhoxJzUTgURuNYvPZbGbVJQ63MPibJ6
         DqzNiSCnHmUQqpArfgPz3ufTFKOofk2FqB3tX3UDUjZu5suRm1HVGF3p0zOvNxUB8fri
         Yp4lM0bhhEiYUK3eaw6yxNnkTdZ7LZ0TfnTMpHuEy9ZZTIzxFXTZGCx9Q0x3SvD4B8EL
         iNAqdPr1miLfUfrQTs+03K/2mi9g+fODLugDVSgY3kyrhLVzz2nwapJbKyxUiQuCyt2C
         TYAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UQ1Ze59KqAjJEAhxztB7QlfUplGOPNY/s0TsWhTnFS8=;
        fh=X54kf4G3nOzCQu2YKR2RKSLiZ0hz6xIEVQlQQW2/wCw=;
        b=L98xpxhogkNwb3P97Ww65Y7wv0PhlbraiomhaS8iRqgFc9s83mrRen41y77I7uzqfO
         ggcJzGLIO5g2w2IbYBkEUvuy+wdFCFaS1VXSRmSlB/jMvG5Pgh5b6bmQ15afKsTD3bOH
         vBx23VXsYKuochzIE1UR6IO7OEiwEIluV3l0MhotX2rVghHZhXgnPKRBOsnHOcUM3lSa
         XwTXBnPVzR/xWpSK5xWL+KvRvVETbhJZpWsVIobun3Exz6AlKy2ZEbxTbGdiWbBovOji
         Oy9kjcY/u6Db4+/YAuf96mB33Stn/MiMwVrY8fxxN9IJr+hIUQCPKDi77U5zR3igAqIg
         nmaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786314007; x=1786918807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UQ1Ze59KqAjJEAhxztB7QlfUplGOPNY/s0TsWhTnFS8=;
        b=Sq8IBaGFqcusE3v3lFOhgaF/pfoSwnynpX7vjsrwL7zPEhKzm7XNR8ZTvyvkQtpEYK
         gkGODNZ+rbL+mzKv2/KIyMOoLevrxu0RBgSnIOYhDAoGywLtl9O6ZKfDROmoncMaIYek
         e04wVUvx6OEovXRGLWxNe0IMn3acgMBNm+Plj53GinxLfJU7MTKWTscLUtr+aKklKqOi
         MuD3Uex0hAD4OrW43/6D/Irkpi413AhEfArp3sflFcISinvJz6LzNrsAtXqkbXjpmHKj
         dDku00ryJdBFmNnePmcEYBOOh9vv/RuSVgP5bHUwBecNvcEBzp+CKJoIoUEvPD9R/mjK
         AlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786314007; x=1786918807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQ1Ze59KqAjJEAhxztB7QlfUplGOPNY/s0TsWhTnFS8=;
        b=n+6iUF4JmXWpf8IzUtLevakXxqz4QaVjezVrgjVXHaWjdpK+AN8R4egAEc6FKs7/SN
         hvsd0a/JprpEzQG+iXjRniKMY9aZbtGYu5ah52fFeMDaLN+oA7IcJlai7bzHaG59i+9p
         kzCc8ur0aCBA5Jv+vC6LdknqLEhFbCGm/DMYmJ0PpDtPZY4SPTa9QYCK0l63MEA7M2+W
         eg+ZasMU1DWBq1DRrTKDeKd+P9zyODuDrkAJAzhB2Pz8eb04GYhXJiEgTuYfZrLNVhvB
         im+3q0LOC99w3II8mtK1+/8TOx0D97rg9+xVfaO/PZ5mPR4Zwbh3YKimQvnmcV8qqK5f
         8rbg==
X-Forwarded-Encrypted: i=1; AHgh+RrIf959/n9diJsLK3RQOfjypxHCijMAazL21upkqR2m6E9Q5n8/Y161bmWEmhdfkIHOfJrBiuXK33M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4K5bh/jozx8fAuoQUcW2IsphkhiCWP0zFEztc/Lk+jd96rfWF
	aZvRjCD2fXdNxT95nAlIHpIu5J5eVX0IY/Cn4bDwyj8OnIXrJYcO/BwLYVHMMW0yoZLB+3fYByR
	itfoDL+x1zUTuLoyNBbFiqvAqwubc7ch5sRbs
X-Gm-Gg: AR+sD12kdTV4zEfJ14voE9oLO6A0ctkVmo0EcyWzbqbPSdlPJau1dSpGYP4PMcF57HB
	NT9JXdRBOK2k3Ieu+1GIM+5WRmasOynxLnp2CdDvsmM+WZ+KUaTkrEjspoHo4b7S9GLAw2Ow2ez
	4g0IRdbal2x5qopxzexd5jFedQi8gg1fS0t9qTeyAontKV9A7zH5ExeMUJ4y/l6+aHGrFiohk/k
	3jQM5ZsHg9T7SEANeoSJd1iDKXuQphQPTO2KXhBhnwYm68DjiOOwrI/MYJlRoCNQYsTi8FkpOpd
	apDQXzdV8KPFZMDhq30rwXgciWiQikZ3PQqt7j7mvmb4/BFOxTiSvthkxUCRZncdtGQq9nXrdwb
	7+A==
X-Received: by 2002:adf:d006:0:b0:47f:9171:bca2 with SMTP id
 ffacd0b85a97d-47fec62a14amr45867929f8f.27.1786314007130; Sun, 09 Aug 2026
 15:20:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFmvuTXQbqbt3qxqUXitzboZhiMxAC7aaOqAtyZXs+QtJvAjBg@mail.gmail.com>
 <a7f9d958-7f9d-40eb-89ea-56094f60c075@rowland.harvard.edu>
 <CAFmvuTXx6bOEEusjf=bw5c-RDVu-bzRLbd_RVnhn2tLe4n4upQ@mail.gmail.com>
 <887e75d3-dd11-4d98-b6e6-5f6a2c3a6ae8@rowland.harvard.edu>
 <e05c6ba1-48f9-49e7-9d56-25db41e70f6e@rowland.harvard.edu>
 <CAFmvuTVYt2bVaqcyJVUSvNZfss6yzVdPbA5Wk2dtr89w2tz+5w@mail.gmail.com>
 <483692a4-8fb7-419e-90d5-1784b71fbb9f@rowland.harvard.edu>
 <CAFmvuTXvwuUrfbvsAQ_VvC9jH5iS62J+Ei23TD0NfQ_igFRJ_A@mail.gmail.com>
 <6761b47f-0230-4f3e-942c-26ed8dd6d0d4@rowland.harvard.edu>
 <CAFmvuTW2cfj5dzkRR8ymenWoA7tw1WAYsMitorvppTwcZ+xfbg@mail.gmail.com> <e8655e37-02b3-40ef-9ce0-98c8fa25481d@rowland.harvard.edu>
In-Reply-To: <e8655e37-02b3-40ef-9ce0-98c8fa25481d@rowland.harvard.edu>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 10 Aug 2026 00:19:56 +0200
X-Gm-Features: AUfX_mylrRrTefaZT8EOLK8ERN4v7AWtbAagN_Px1Eijvk6gYpaTPAMOTbjWMFY
Message-ID: <CA+fCnZdfu6NSix_wN_6ZbP3Bvni8SYPQzXAkDg2R7uZFEP52yQ@mail.gmail.com>
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF in ep_aio_cancel()
To: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Minseo Kim <neck3922@gmail.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 6:17=E2=80=AFPM Alan Stern <stern@rowland.harvard.ed=
u> wrote:
>
> However, I'm not sure it's worth working on them.  Greg KH is talking
> about getting rid of almost all the drivers in the gadget/legacy
> directory.  I don't know if that will include the gadgetfs driver.  If
> it does, trying to fix up the driver will be a waste of time.

Hi Alan and Greg,

Gonna hijack the discussion here: Are there more details to what
exactly might be removed?

I would be in favor of keeping the Raw Gadget driver, at the very
least, as it powers the syzkaller's ability to fuzz USB drivers. The
composite framework is notably less flexible for emulating improper
USB devices (even with the FunctionFS-based composite function).

And as GadgetFS, unlike Raw Gadget right now, supports AIO, it might
make sense to keep it as well.

But I suppose it would be fine to remove the legacy modules that are
just wrappers around various composite functions.

Thank you!
