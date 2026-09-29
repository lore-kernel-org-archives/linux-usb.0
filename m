Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD34522EFD
	for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 12:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685491; cv=pass; b=omST7yRccDVyv/mnlYlsnakqftYzJmuKrn7iTiEKDrfKWrnTldBrsAmEJUEjlL9iAWhDeH4n0tbHUCibdnha7aDGS1RKX151DpGLzuqh5eaF9AzzqP8rZ16JIp1T/Vn/6Tziuj1sYQZfWNjhRQ7GzWQBuSkQgnQuuoJPq6VTKkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685491; c=relaxed/simple;
	bh=gdwEoK7FYkbsV8ilbpkgZH4Vf2p7L5T3GmRfoLao/do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWHrY697vVvjhgFgPrOaa6NdBTgXvPCZXmU+7TOeYY0xoe7ktAK17rrYfULtk3zjbf/YJQ7vaY6cmWHkeOI6GZ9hyzMzLQtr320mcC8xV8yOm/DIbWDpLz5aRbUMtV+iXSwe44rqZvxbyc6bDLMF4e5h/fi3tardy1jcPfyfVZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Olx30u+2; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Olx30u+2"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fbef5018so27706755ad.0
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2026 05:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790685488; cv=none;
        d=google.com; s=arc-20260327;
        b=pYQh37IX/m7eG/FyrqA1zBi9gxZAm2NtnPCPAVkpd7OuU7mTpgrhmcyjCsoc9l5jpf
         iS6aO0xGepAtksHMxBv7QKygpKN1OkUo06xRfLIL15/2IpFV2IfG8T/zW37tDVc3ZoCI
         b1HOHlEO6BgUToGqvKO9pcr9rIO/tFxdsgI8NLyripv8z6k0KbiharNVke/xKODlUt7f
         cy4h0rC/AzmLf8yeoXx98aQWkoQ41iEi2++VfWphvGQrBn1KHyptRa41r1Pj3IDOkEhU
         DE1Z+tA0A2YhZJoTQMe9r1LdRNV6G37NdyZnNA9Q8VK5k9QM5PSp2f2FLgF4UA2kVftf
         tLoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qoWvSXu4SSqUtmIwYczgMuYDrPposdeRENj3E/8sf70=;
        fh=BH5834alvMfsY8qJJtcKCWBTuiEba+zBxkHxXZZzfOE=;
        b=idvwDQ7DhYeLJVGuqho4w0H5Pyn65Ly8FaVWrPvJPyvxsLvV9OAKO0ebtwqYJ5dtUO
         LXlvw6qSruwUAcC9Tlg4wf12frTZ0/Jru0vEwtP5l8kCl9vyL5/LL7H6YBFJzZ1GZ5MX
         Sb0AEbhHIzdEzJn+IEZxTOsTb42NdUzkWgy+5p0bLnTqt4WbK4S0Fx3iPVAAUmYLF3h/
         vI+RswuenekE1KOtBY6kQ6zcNjXiUFvsaDXK2W0WXk/BMW+4oyBih/OkMX7wxz2G6b4L
         G48mM8XOwPRHGgCLnDhbIJhx8W7OVYODWHFEmiByikvBGcSMwmezZXOzVZHGZOU24mom
         HCvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790685488; x=1791290288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qoWvSXu4SSqUtmIwYczgMuYDrPposdeRENj3E/8sf70=;
        b=Olx30u+2vkzdBRWUin7CaqOCLIIXK1eMdtQVJTsR8tjAyFCYBTleImUPcbU8xHqYft
         IJvxM88y17wrSm5bgv9dY2qky2XIhsB+sUjp/Lt58sKAenzsCixSWDjbkbm10HXONv9o
         j77FQ9/ieXl6w9wbcMRONwV/FqlDC3OtTW7sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685488; x=1791290288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoWvSXu4SSqUtmIwYczgMuYDrPposdeRENj3E/8sf70=;
        b=vpCYFO8wm6YvD4jQOuj2K8WopcQim/AFP13CZZa3oOGwRQnLDefZ6+j2gw2ee7PoI/
         UTEJP1SoEPM4N/20MAaeSlbHnpT3tmZnqpENZqi5yZ1kAXRxcaQmO/YYfyizYx0OYW19
         DvkcBcBVWqgAxgvhfpfR/0gqoQlHTaJiZ/maQZmfynZfMdTLZqxUzk47Nt1kaPjrr7PC
         Xihg4C7Qb5wlmH7cYWk4NU+YIiRptmLIC095Pmlkjkx3HDk5CUy27ND3u85hMQVb1wFM
         aa2Fkx7cLXXLGtWfhuH+MPu1Cgo4fcAOFLOVht7pAor7Vp2vNAPPfBTvadiZrfP+Dk+y
         i16A==
X-Forwarded-Encrypted: i=1; AKwUvBw9XvisCT7jf9Sb9+Hvk4nkKYvoYQebBVJPIcNfi6qW44SPzU6HmSJBR+7jRAvIac8B2r549CykSco=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB3L6XkbzTw7chmAuwiK4NGM8pQJ0fvo0hG65kS5G3pzMeL045
	YORGYQ8E9pXTjZPs36/FE3by5Ow8D3ia4wvbwaUlCKAUmtEclz9u7PwDKl91HgjwKTq/vya3Qcv
	h24+ccCuHIrnMTDkuJTTEBX7kAphc/MLwFxCrGRWT
X-Gm-Gg: AYBFou2Tj/XNtdpLj66TrigGD3lBfetwMKodvPwrfGRk4mWmyV2FTCy9Zz8KMOVFkoo
	7FXjsA8t4gOwGpNlPSMbtDh8zddnz005gXXzv6ouIhhbWgX+AvpJnnbFQIwryoI7rCospIsgd5H
	i5QqagArsmiklvk+bpXBBkbXF1AZax+4Bw6UMUMGoCEntjeCd763Aig8jh7M4tyECU5KpcmBorq
	3EzDtLCo8+Rm2FJfIfO4csCVVhKTmlzn9pwx5YsP6mv7TD51HjeeMkkl3N1iTjxZmPSHdZGjGgf
	paW4EE99LBWSox51vvwwhNI1mUDKf8Q6auFqMe6cxwa3IVGWQqxGD8NAXmLtwUz3qiE5SLBonPx
	7/ZQI8ew=
X-Received: by 2002:a17:902:d2cd:b0:2df:9eb0:761a with SMTP id
 d9443c01a7336-2df9eb07bdfmr90906095ad.25.1790685488373; Tue, 29 Sep 2026
 05:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927021649.8967-1-cnfourt@gmail.com> <20260929010937.21559-1-cnfourt@gmail.com>
In-Reply-To: <20260929010937.21559-1-cnfourt@gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 29 Sep 2026 12:37:55 +0000
X-Gm-Features: AclHuK8Kr2_e3IG10_JsHj3zc5b55EX5CFHCX9UVqeJ6c3jOq4FtBB5ZoR7AfGU
Message-ID: <CAMMMRMf_5Vgrir_PtNPhvd5HDUP=_YsLzPssR+ciKtuHzqfLFA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Skip CAM query when partner has no
 alt modes
To: Gris Ge <cnfourt@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pooja Katiyar <pooja.katiyar@intel.com>, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 1:09=E2=80=AFAM Gris Ge <cnfourt@gmail.com> wrote:
>
> Since Thunderbolt alternate mode support was added,
> `ucsi_altmode_update_active()` is called on every Connector Partner
> Changed event.  This made the driver send `UCSI_GET_CURRENT_CAM` to
> PPMs even when the partner had no alternate modes registered. Firmware
> that does not support the optional alternate mode details answered Not
> Supported, which produced a spurious error on every partner change:
>
> ```
> ucsi_acpi USBC000:00: GET_CURRENT_CAM command failed
> ```
>
> Fixed by skipping the command when there is nothing to update.
>
> Fixes: da87d45b1951 ("usb: typec: ucsi: Add Thunderbolt alternate mode su=
pport")
> Cc: stable@vger.kernel.org # v7.0+
> Assisted-by: Codex:deepseek-v4.1-flash
> Signed-off-by: Gris Ge <cnfourt@gmail.com>
> ---
> v2:
>   - skip the invoke of `ucsi_altmode_update_active()` in
>     `ucsi_handle_connector_change()`
> v1: https://lore.kernel.org/linux-usb/20260927021649.8967-1-cnfourt@gmail=
.com/
>
>  drivers/usb/typec/ucsi/ucsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index bef3f9b71d71..c392afdc27ae 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1519,7 +1519,8 @@ static void ucsi_handle_connector_change(struct wor=
k_struct *work)
>
>         if (con->partner && (change & UCSI_CONSTAT_PARTNER_CHANGE)) {
>                 ucsi_partner_change(con);
> -               ucsi_altmode_update_active(con);
> +               if (con->partner_altmode[0])
> +                       ucsi_altmode_update_active(con);

Thanks for the patch.
Could you please send v2 as a new email thread?

Thanks,
Andrei
