Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F093B7B93
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 03:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790825186; cv=pass; b=phuKypxF+XAAFMA1EMlDQa6RJ/QBleYvIUsV64Bkes1QEaFUcZiI+fHeXylS/rW3LYK3FfrBITXAC1l8wq6rmHNmQKx70GjpDIDDdF9z2rRVaoNQXkEB9tt4QsK4ODOiH4y8CoAIMzSKLOg4qvaSS1V1eieHWvUZ26WwuTqjWFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790825186; c=relaxed/simple;
	bh=mO7cZZw6gbOK7t/+3Qun+Qcpm5Ph2b0FOIuuDPVuWPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fA66kbnYBPYM/MF/b5tD6lZw951FM0kE7WGWQFzJ11jkVZlCjgVWtTDC9tCfn6451Jf2HtZPM77noogs9QAJa49pOC7n9pXjsfK7krsM+fG3JBnfGn67a/Ckp4Dx9pRXsGIhNnUrvMYGfDYCrzyK2h0pWDhmK/hh2uX46yGnte4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b=nGIxzlW+; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b="nGIxzlW+"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a773960275so3975291fa.1
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 20:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790825165; cv=none;
        d=google.com; s=arc-20260327;
        b=qVG8l5Q1/ZZuulqJZXyX0O7v1ZglWuzt1Krdn9QtUxQercRIygMvrTcUPNBXH3IcDk
         Hncj5hkRaKzo6X3lnWsAs7wj49HeH9ZRN9w0rIU28KgvrSyu3jFoRxxtwETVkC1UdPq9
         6kUAweIf+5sFtedhZjcv43JISZDqRdiD0R2oWfyx7WfNmzhKsIGIypyXoJUwM8oFV+vx
         yjlWhztYkRRm7efg0n25Q5FylwNTxME/SqGdnL9/wCLcrGjowAZmLqTGaUhKxZKptG4W
         /F2J1Yrx68TTW4OPwSyu8PTIQsuMIL7Jb1W8w8oZWOF25biGGBJNFa860PH2gslTYs+d
         vWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vbm7P3UAq4mEN8zDnHnpp8JluPeYIiuA08TMdFT7DGw=;
        fh=xQw88nyMLc91U1JCO+UXoE5ntvmcu28NJ9oeyDIo+Ak=;
        b=o8IZUhpZS/Ym8ERHquZ2FcDhSDisIyW9z84RGGe1J1DeVSP3jDmvm8ZPYIoWl+K6j/
         kW+dqS/h3vWtnoGhGUl7gxMuQvXtniLdhGYeEC4/0PPeb6uGwpBcyba9X92bFMQR6HZS
         Q2p6aZvKprOdhKjKZuWtTrgKgoVi1w2fQXEiLnhu4GTbjVnGjNyZmRGMa0757pVioNqR
         a9EU8mV8AzvJTeQ7tUMby93RGIDWHLuXTWIPhaeu+EZL9+YJY933bZKdjU2u0vd9mjHf
         UTjWM2rW0J+C3M3VHCeAFwf5EoTAM5xK3JtQvo6LprQTxIK2G/KF4CpsSZ1+RNO5RYY0
         cXlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=canonical-com.20251104.gappssmtp.com; s=20251104; t=1790825165; x=1791429965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vbm7P3UAq4mEN8zDnHnpp8JluPeYIiuA08TMdFT7DGw=;
        b=nGIxzlW+EhhTSa6xWfQgGYHuht0nQd3JoTV1GtSiqqbqd+acwsPpMztAr6iVnGR9ZZ
         gsj2qKLybrdfBlT5VdwiobpBx2I4IUU4IWV7BKiQnlh9WaGyqQ0tLX4cSsa1bphC0VQt
         55R8iRpxbV5fKtnifx6MFxGoDFIEqDBLe+ZOSo3o362tpg7BoQgCdJQuAtS+J/02S0IC
         iThF90xjYBez3Sl0Vlf2SFWtE/8uOqMGQXCJhkToeyEGMV7727XjDX7wtydWIajf2ZgX
         +lhvvOYjmtrtC7mJHHEOgDTZ3gaGmUGDz0V0JRDRv/lEa2hynbWeZ+GIw+FpwCeZKOXE
         GOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790825165; x=1791429965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vbm7P3UAq4mEN8zDnHnpp8JluPeYIiuA08TMdFT7DGw=;
        b=HHyOKqXLxjhCByGhFtOY3XHMKQa5U/keCQmnPP+qO7ueWGcUTQplV7CSuJxbykj3QS
         nm4UazQyg+SC4beZZUTOPZMfeATKdZjg11iAuGPV9jJDApC9TueMOOIlib6WJUXYMKig
         +RIoB3nCl9nS8s04jeFaPfr5+bPwOd6GsKBFKy1SKSgHdXgUk4JybKds8O2dk8uhZYwp
         PNj4x83SR4LXZsiDxTHd5+87Ze0L9sHzlHG8Vej2mFTAHBnbaPe0bL4gj0cCuJ0HIw8i
         +QCuioLgrqrkbsoWCyqStVMAON5NZYCqP9MoD/9nFZj0c307FF8Dxznhu5Whr9szrOyE
         LnTg==
X-Forwarded-Encrypted: i=1; AKwUvBwqOguWSBybKO/tgUVmarV5cmfRz3F1FBpkDul1VdiuPkXRNy0ke8Xp6LjM+aMJln3esGCyraTaLmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKd7xl7ZKwY5Nfcb2XfVRDOELCMkVJaN8FL/62MZvy698WW73qP
	DO1C6mBBsRKGAY2UTYLTA9UCsXoWZuP71QYyY6fRw9j5hcmeMQS454v9oVJSBS2udu1poMVudJt
	eU6gq3Zqkm0FqurZ0d67P9B1yMUUiw1vspA==
X-Gm-Gg: AYBFou3ffVR1clsyHZl1iknhWeK1sOB7mA8enHGxpT3SPEPNRCh+3LilW3N5FgyV69S
	UE7yRMSKwG6+Px7z01yhjoCTp4tN0GKwttFjoiASn4eDv/6KeSNUs2s5tcuPSbqMcmjS+WTgik0
	mY+8adfB87hvVnDss/ALaIwgz5M8Ru7RuMlW9IZGc56HO9kqiit2l2WvnhuS3VDKTVjDr/Weijb
	OZLcJF9hhf0wpgB3ye7K4F3AXEe1OkefLpuQDHAXAY33huyMePWqbfM9bfg/jsOONecwnZccYuR
	gUIweHM2ogkXdLytlwfci42Rie4vJAJTjCfs8HFCZ5W3F6OCx7Mglzg=
X-Received: by 2002:a05:651c:1991:b0:3a6:772c:2770 with SMTP id
 38308e7fff4ca-3a783340ccemr3465561fa.1.1790825165269; Wed, 30 Sep 2026
 20:26:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901022754.3102934-1-acelan.kao@canonical.com>
In-Reply-To: <20260901022754.3102934-1-acelan.kao@canonical.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Thu, 1 Oct 2026 11:25:53 +0800
X-Gm-Features: AclHuK_nYGrSEKnQrcZDBP5n4iALoJi1Vuobdqv_sext1dnPW6DXbN7ksHy05v0
Message-ID: <CAMz9Wg9NDqcZgVobYRDD5OFHe-28xX4X4w5wfq05DJL1U-fRkw@mail.gmail.com>
Subject: Re: [PATCH v3] usb: typec: ucsi: recover from silent PPM completion
 in sync_control
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benson Leung <bleung@chromium.org>, Andrei Kuchynski <akuchynski@chromium.org>, 
	Jameson Thies <jthies@google.com>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A gentle ping

AceLan Kao <acelan.kao@canonical.com> =E6=96=BC 2026=E5=B9=B49=E6=9C=881=E6=
=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8810:27=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
>
> Some firmware completes UCSI commands and sets COMMAND_COMPLETE (or
> ACK_COMPLETE for ACK_CC_CI) in CCI but never fires the ACPI notify that
> would wake ucsi_sync_control_common().  The driver then times out after
> 5 seconds and returns -ETIMEDOUT, even though the EC finished the command
> successfully.
>
> Fix this by polling CCI once via poll_cci() on timeout.  If the relevant
> completion bit is already set, the EC finished silently; fall through to
> out_clear_bit so the normal read_cci()/read_message_in() path retrieves
> the data and ucsi_run_command() issues ACK_CC_CI as usual.  Only return
> -ETIMEDOUT when the EC has genuinely not completed the command.
>
> Guard the poll_cci() call with a NULL check: if a backend does not
> provide the op, skip the poll and keep reporting -ETIMEDOUT rather than
> dereferencing a NULL function pointer.
>
> Fixes: 584e8df58942 ("usb: typec: ucsi: extract common code for command h=
andling")
> Cc: <stable@vger.kernel.org> # 6.14+
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
>
> ---
> v2 -> v3:
> - rebase and resolve conflicts against v7.2
> - Invert the post-timeout completion check so the empty "silent
>   completion" branch falls straight through to out_clear_bit instead
>   of being an empty if {} with the real logic in the else, as pointed
>   out in Greg's review.
> v1 -> v2:
> - Add Cc: <stable@vger.kernel.org> # 6.14+ as flagged by Greg's patch bot=
:
>   the Fixes: tag targets a commit already in released kernels, so the fix
>   must be nominated for stable.  Scoped to 6.14+ because poll_cci only
>   exists from that release (absent in 6.11-6.13).
> - Guard the poll_cci() call with a NULL check to avoid dereferencing a
>   NULL function pointer when a backend does not provide the op.
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index bef3f9b71d718..0363ed127a567 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -92,8 +92,28 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 co=
mmand, u32 *cci,
>                 goto out_clear_bit;
>
>         if (!wait_for_completion_timeout(&ucsi->complete,
> -                                        msecs_to_jiffies(UCSI_TIMEOUT_MS=
)))
> -               ret =3D -ETIMEDOUT;
> +                                        msecs_to_jiffies(UCSI_TIMEOUT_MS=
))) {
> +               u32 polled_cci =3D 0;
> +
> +               /*
> +                * Notification from EC did not arrive.  Poll once to che=
ck
> +                * whether the PPM actually finished without firing a not=
ify.
> +                * If poll_cci() is missing or fails, polled_cci stays 0 =
and we
> +                * correctly report -ETIMEDOUT below.
> +                */
> +               if (ucsi->ops->poll_cci)
> +                       ucsi->ops->poll_cci(ucsi, &polled_cci);
> +
> +               /*
> +                * If the relevant completion bit is not set, the EC has =
not
> +                * completed the command; report the timeout.  Otherwise =
fall
> +                * through to out_clear_bit, which reads CCI+data normall=
y,
> +                * and ucsi_run_command() will issue ACK_CC_CI as usual.
> +                */
> +               if (!((ack && (polled_cci & UCSI_CCI_ACK_COMPLETE)) ||
> +                     (!ack && (polled_cci & UCSI_CCI_COMMAND_COMPLETE)))=
)
> +                       ret =3D -ETIMEDOUT;
> +       }
>
>  out_clear_bit:
>         if (ack)
> --
> 2.53.0
>


--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
