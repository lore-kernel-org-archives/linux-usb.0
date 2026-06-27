Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD6E3537F9
	for <linux-usb@vger.kernel.org>; Sat, 27 Jun 2026 05:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782538509; cv=pass; b=ampX9CO2JfjpJfAIjuaYpGKohEgEqHMYQc4J31i599XzzspHb2B2CJZkYZkmbkZcyr0KMYvbaFS4ZaIAEReaK//qB1p1GeH4+1tUkDJJK9bBZsZdby1ptFo5WZQnBn7s+TphktERCE9OVWJkCio3zcInIeG96jT2yGz5dsIY6GI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782538509; c=relaxed/simple;
	bh=I95998fJ7/ciTUMSpIssnMY9mIcZyePior8gH2txOzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfqCjFBLvkerCIxhC24tMqlhT8bKHR1QJbTH12YHeVOVpMQrGm9MTT1222k4kcbR9wjSzupwK5dRdYeZWjc+gJe3oFzyL+CDx72QAyrHhthd3UD0PAHx6bmddH59bjPIi+ZjZxY1rMVvrz9+7W0vgGfJ4cz0ix0QNok+7QBT/oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNceUcE7; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNceUcE7"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-735df2106easo738599137.0
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 22:35:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782538507; cv=none;
        d=google.com; s=arc-20260327;
        b=YG0kAJbFHwZ2orAwQkUeXmutEHLkvJND5VaJzOGsL5ELVk5yeRepaDU2qmotrBsuqY
         289vtvZJb+Q//cJaaWpp9RUfRycz6ry3y09aiIIY5nW3kOyAP1U5XCXKvSvFUOtnpYh2
         4fcPRQUwtubf5H51dKUX/VR/aPOBSiw5z4HKpadAuoMaa8Ygib+CflqE7Db2lMzJUdcc
         M7iHNGxdSH7blqsnnT6amD3z7JjHj7zDacvZe+Xv5idKVr9mTJ70Vikgr3JiIYCJ0DHB
         QOhY8GBDqndfvEwxse2Dx4B4ZLn71qHognn8HvZsKkptPakAyMnl6hy5Q/x1nTBsYD4G
         18xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pIhqcm5AmAdJmBC5B9mtGL1DFO3ooFECfF8TV3TVWZk=;
        fh=AH61xHI5+7gu1sO/Y5+YjPm+JS9iC9vaq2IrAgDdPZc=;
        b=hitp+2FlEe2hePz0FhfAa7B21zp7LYfRDQv3zGdXFrz0nBsuXPPyEigzMm+gyqqodI
         nRc0MB1jG9Nuoc17F+uP8yKXjHDuv3n5f3gdROTPpBBR/svDgzAiq1PTNXdgNcqh+mUA
         4j89d0kh2VX1v1Xs/M4fff+a5yUfUgA8chNyKg8kyOM4OE3uCd1iDIdbfCaZGmwILnWx
         kAPjJ7WZlHnrnZ+Y49b5bN5MDL8VweshaX1LfzA/JetuBBESamkHIurSFHxvFZuqt4WG
         Sf6kuMd9bjyJuMHYyqsGNe+YIYmNjPs2wRXMyaSD67yblc5KczOQirWXoC2eu4xu6s3i
         pZ1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782538507; x=1783143307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIhqcm5AmAdJmBC5B9mtGL1DFO3ooFECfF8TV3TVWZk=;
        b=fNceUcE7yReEQUhPxvmvN4VlTzj6LSmCKDhnREMBbUrCPfLmaXKLuGM9/K8qeYcfjU
         EEi4dlsuJlTe4QDDePkztbRcZGhFsh3zI47JhrMFsJeBSsgqgjRTBKK13YZpr3DnXNOA
         5gwJIHQlY5CJtJ/TgAAMljp2EB8f3ItGra8Yv8ZKbngIJ0VUSeH/+E9xFVQK8wAOazqU
         r9otN+clZUFwPlLs8HEntlj+bMko27pktAmC9ilbNkXeLLeBEkw4eC74+JCfxdVDKlqX
         s9g5AKlfRRpj/JEkL6pPpJCq6lfSdJfuiSgXsVtx4caduwtRU8g+Q9JNwRsXsCSC4rhy
         16Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782538507; x=1783143307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIhqcm5AmAdJmBC5B9mtGL1DFO3ooFECfF8TV3TVWZk=;
        b=N0iXefg/ygMTljfSyumAK0G6+oaaV/08SR8uNUglavgU8sTPxeTtzvCSj0iCC+MTqM
         Q0mx7Hmq7wuvmb+f4GkaO/JaxBnMFaYvfvAqfQpItAcqa9CyGV12IdKZwKcZ/G5M2yQX
         9HNSuQyZfTp/eyabUdAq37eoS9eCLgI47ru1INa1cr5+n83j1s9MPLr5ItQWhszZ5fzS
         GLuN5CNp1y3q7QLF3KmZ9VakxS6Z9aTbrHN4UNhK9RORzY1+CmfzIeiNtSfwFtmdAHKb
         ABvYxbBJu7FOoKCS8HdGIxjZ+Q3DVntQZVQYabl5WfOE+dbtlSOTV38I/uSW8SBRyMcN
         uVQw==
X-Forwarded-Encrypted: i=1; AHgh+RosP1A1A2cPk/IpjMfdOtV8i6W6x434Ksvv/HFhP3MApMg5cjS1A+ilbaIezAwn+k+SLV16H8phNIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTrtF1TepfuDfuxQQX1dCBs1h8hkKJdLTVozEG54W5FBL73UOS
	S2tGluXLxS+c3WXqnCTpVlM4b67/JxDDkXMvZpTSXLhjuPuot287va72rK0e2AfpzvttsPyzjXS
	Qb2gu3FbVbWt3fAbw+E7ze1bXi3VCAyg=
X-Gm-Gg: AfdE7clLL3R2rPo/akfgFZaw4Be2H3ozRWP9yCoCcTd/jIcewcO7vAn/YtC+9oIoPgi
	nRKuG6hl2DBHXPacudyExrd7/doOdlNBmODoY+CWhufWeQQroA1LkvdT74535ADivtPQXcQUzch
	AUgdM8rJtKzOSuq2jKDUYV3LSd+he10tt/b/gGBC2MhAI68rEzovRmpL4J9/Ekcsj3JJ5UTXtWX
	HumYVmBKOzs/+tsuXEeKc3l9coWnAS/V54pyr0gHdfRlG4qqH8M7viGSca8dTT2UtFPUaB+fEub
	eeXfYZgy4Q32kDBLFPsyOv1j055ebAIjYbmtJu0=
X-Received: by 2002:a05:6102:80a5:b0:6a2:b2a1:f16f with SMTP id
 ada2fe7eead31-734362b5ab6mr4861776137.18.1782538507403; Fri, 26 Jun 2026
 22:35:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622153230.75195-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260622153230.75195-1-pengpeng@iscas.ac.cn>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 27 Jun 2026 13:33:40 +0800
X-Gm-Features: AVVi8CeeH5YmJXI55RsF_RpWrji7vaGIye66LT0JbCteRliHFLwWefVc3rdLXyg
Message-ID: <CAH2e8h5fOrSbma9HbjG3BLRArBEf72Qid_6O-QDSLJc-gZJ3EA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: gaokun: unwind notifier on UCSI
 register failure
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 11:32=E2=80=AFPM Pengpeng Hou <pengpeng@iscas.ac.cn=
> wrote:
>
> gaokun_ucsi_register_worker() registers the EC notifier before calling
> ucsi_register().  If ucsi_register() fails, the worker currently only log=
s
> the error and leaves the notifier registered.  Later EC events can then
> call into an unpublished UCSI instance.  The remove path also
> unconditionally unregisters the notifier and UCSI device even if the
> delayed worker failed before both were published.
>
> Unregister the notifier immediately when ucsi_register() fails, and track
> only the fully published state.  The remove path then tears down the pair
> only if both publication steps completed.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

This makes things clearer.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>

FWIW, ucsi_register() would never fail since we hardcoded the ucsi
version, but nowadays ucsi init work is still a question. (failed to
register alt modes occasionally)

Best wishes,
Pengyu

> ---
> Changes since v1:
> - Drop the two-flag bookkeeping objected to by Greg Kroah-Hartman.
> - Keep the existing registration order, but use a single flag that is set
>   only after both the notifier and UCSI device are published.
> - Unregister the EC notifier immediately if ucsi_register() fails.
> - Compile-tested only; no Gaokun hardware was available.
>
>  drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/ty=
pec/ucsi/ucsi_huawei_gaokun.c
> index ca749fde49bd..0dcbbff5f205 100644
> --- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> @@ -98,6 +98,7 @@ struct gaokun_ucsi {
>         struct device *dev;
>         struct delayed_work work;
>         struct notifier_block nb;
> +       bool registered;
>         u16 version;
>         u8 num_ports;
>  };
> @@ -457,8 +458,12 @@ static void gaokun_ucsi_register_worker(struct work_=
struct *work)
>         }
>
>         ret =3D ucsi_register(ucsi);
> -       if (ret)
> +       if (ret) {
>                 dev_err_probe(ucsi->dev, ret, "ucsi register failed\n");
> +               gaokun_ec_unregister_notify(uec->ec, &uec->nb);
> +               return;
> +       }
> +       uec->registered =3D true;
>  }
>
>  static int gaokun_ucsi_probe(struct auxiliary_device *adev,
> @@ -504,8 +509,10 @@ static void gaokun_ucsi_remove(struct auxiliary_devi=
ce *adev)
>         struct gaokun_ucsi *uec =3D auxiliary_get_drvdata(adev);
>
>         disable_delayed_work_sync(&uec->work);
> -       gaokun_ec_unregister_notify(uec->ec, &uec->nb);
> -       ucsi_unregister(uec->ucsi);
> +       if (uec->registered) {
> +               gaokun_ec_unregister_notify(uec->ec, &uec->nb);
> +               ucsi_unregister(uec->ucsi);
> +       }
>         ucsi_destroy(uec->ucsi);
>  }
>
> --
> 2.50.1
>
