Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FED481648
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585273; cv=pass; b=GzpS9htn822bMkwadaBd+ntGgu9pgUmhn3lYLKaIpkER8kBzduuuFzimDf14Jl1L60chGDSo5zhayaYe9rIFRlvxbChi2sk9NQDvLeWkWaKPpNgqpN4jpKKXFmsH9HlaCuNHMFv8PgTLThwVHJkmhnPfIY18Z0rAx0Tlkm08HXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585273; c=relaxed/simple;
	bh=dJKpOVv6fqiFc8ddNiCOZUDl7GePNfYcxXC4eyDXn28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XAsDu4DOrPYmKay4vSTguHnI+REWBLyij24SuPJQ5ys4V2TNfzyErfq/DnIWcsHgYwdCj43n0W81kFgeY19wovTDkVwS7/Tfng+WwGNj5lUuMHtN+AP7oEv6+A9ebJtRNFTnjNUaDqcywWDAylSi8h9fLOf26ryuJJeVcibf5rM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kYHDT28z; arc=pass smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kYHDT28z"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so11133725ad.0
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 01:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790585271; cv=none;
        d=google.com; s=arc-20260327;
        b=GJM/ZFkgJz5xuSiaqlxHYXEqkqCDZWdbjpROumR+rWWEsyPj+M32b4UIitdpvzraAW
         Q7HMcU5pCaF/Hj29HsNVGWUeXf7QYMivG9KaCjTJV4KiXcMO7nVWPMRU92wasyKJT70p
         mrExkY8iJshMsBNm1V3xIpfCHaR0e2HF7h7afAnrzwdHvDpZPWxvVKJAeB1JmKskx6CM
         egZom+BB5RhLh8TTr3u7Ix4atByNxDZYQaJN/3ushwwb9tCMqyAhyExZchCQ3grpJDaC
         juUcWa8zgcF7AoMrpyib7WbCUVuD37Slk0Nsp4Q6cyk7EeLbr3s93EBOolI+VRe3TpKB
         X5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mYUWucSS/+zmzWz3eV15/EjWdNuEkuuWYSgDXuT5k/Q=;
        fh=o0ObHILsUm/ArumkRFHbCtoxLpVqERTEu4hyUTrC22Q=;
        b=Z3hwwegRag0Ic3IC3q838zrYU7ZD1CyeY3HxE0TvFQ4IaCx3LknO10XOGRs/jliCeD
         uBzjXkflEsGXSdg90rpiDZk0WEqTp5JZnviSwxWBXLWeunpAWEY0WEstNaMbSqETGbhN
         m98p7VirybTUashRt9qdQuO+UW4lMRZdBdIUC/lMv7PDcAyMsvzeU8gn0V9WPPaOx8QY
         86A6g6pDBJCVDgb5KRn/8nMkAkRM6OUmFLV3Sbf14shQLpsP9NLyiLlmR94Qe2KDxnBj
         lqAVd3l8/A8yv+zVN4Y8xVb/DQ5YcHdxLXRCiAg6BxK0CR49RIUzomgIBBi9fGYimSXG
         ddLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790585271; x=1791190071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mYUWucSS/+zmzWz3eV15/EjWdNuEkuuWYSgDXuT5k/Q=;
        b=kYHDT28z+Lf1Zv2PVtZwV+bex6aVsL6C46lBcLxOJEAUAzRQjRdHqte6WC0N3k4mDU
         DA/XrwMMq8a1udP0hcoFnlrQaa1GQ5jomydyXeaNhgHJs4MuWa2OH2h0Rzit9QyjTdc6
         X+KCWkOeCEXJ00EgyTL7rWhlmt2TuP2OzIaVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585271; x=1791190071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYUWucSS/+zmzWz3eV15/EjWdNuEkuuWYSgDXuT5k/Q=;
        b=OVBt2rW58ucrLfTQ8wnsfdhU42ZrBS4kIiqeTb3rcC37jlCI+ChWHgrNW/4lGaI+1J
         XP3pdtvaTe5e19djfC0vkA1wXsZyN7BXP3Vpj7NeWddUtJcP+rc8ojvS7bctEWOtUXD8
         GXf/yejn7xMZNZFQ6UBaJ6aMNwP6vBuID+uu+2HB3D1PnVI2mK5FtViFv8gZ70pm0pi2
         3yzcwZarrdLyc9+hHEWv983vT2jT0qszSnRemqIHO2iu0DpTyPDtBFlAa/5E1ghcGory
         SYvMJrm0S8gkedgYox4VCkDxGfuWX4zrCbinyw0Gg4eEoaeCu6yCW6rxnKL344ejGhMs
         Mm/A==
X-Forwarded-Encrypted: i=1; AKwUvBwh0D8bPd1Sp8FUOCSE6T85YtNo2TfJQ62HKX6sYU+iD6XQJktZkV/CHeg8IoOZaW9npi6NUPSz9Lk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAAOYtOwTqU51ApEJ7fl8u/sujiSstCEDiOUebH/Xkm+6YLUQ8
	Ppcc7gzFTqQ0S2cyGR5vPfnAgB+vVJFV1UcEAULhq4i8LCM/8KdmRv8KMJfFHDrLIDc/uW+1rPu
	4lGo4BWIYix5Ku4CDppuX9h7XMHxMaYb8qKGHfY4u
X-Gm-Gg: AYBFou0lU6QwgutSC57T4uUtyRh7ox1mx5Ziik8RWC6IjSYvX9bGhydu4oCI6JN/MML
	BmCYBGaTkRyCSYJD5pn4p6F6b/SVbYHhOA2GFcef0O+uGckoJdXHli6Lu0V13dbHKlXt0KDu2Pd
	t47hs+QqFdO8PigpFP6YmgQyTTejju8xx+0xyWvSXyFIAcQCJfbzItmoYtcwMlKXUKTlPOY4Up/
	X2iolxF9qm2CePrsSUA7xyE3nSZQBR7JRViGsswq8zh5pv61XolPnk6O/yNe5cUJMK6j7OpFdZ0
	SlKKVGwEBZgtmrdL7eg6yzRH6p2x5G3uCWPH1808WAr6f32nn/J/s0BebZpYSlOsFqUQBfG87L4
	lw3fOBRE=
X-Received: by 2002:a17:902:f549:b0:2dd:c053:e662 with SMTP id
 d9443c01a7336-2df7dc37080mr103063685ad.40.1790585271422; Mon, 28 Sep 2026
 01:47:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927021649.8967-1-cnfourt@gmail.com>
In-Reply-To: <20260927021649.8967-1-cnfourt@gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 28 Sep 2026 08:47:40 +0000
X-Gm-Features: AclHuK_CwEL7lxywAL9tW9lf7X78Ed9Y6yHTJv7brK-cGmDSjgzxO9Ta_DmbBfI
Message-ID: <CAMMMRMeX9-r_coX1zbUNoMGU+GUW56o4iY_jfyE5_ovFYs6UCA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: Skip CAM query when partner has no alt modes
To: Gris Ge <cnfourt@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, 
	Pooja Katiyar <pooja.katiyar@intel.com>, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
	Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 2:17=E2=80=AFAM Gris Ge <cnfourt@gmail.com> wrote:
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
>  drivers/usb/typec/ucsi/ucsi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.=
c
> index bef3f9b71d71..71b28e4df470 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -360,6 +360,15 @@ void ucsi_altmode_update_active(struct ucsi_connecto=
r *con)
>         u8 cur;
>         int i;
>
> +       /*
> +        * Alternate mode support is optional, and the PPM is not require=
d to
> +        * support GET_CURRENT_CAM when it does not support alternate mod=
es.
> +        * There is also nothing to update when the partner has not regis=
tered
> +        * any alternate modes, so don't send the command in that case.
> +        */
> +       if (!con->partner_altmode[0])

Should we move this validation into ucsi_handle_connector_change?

        if (con->partner_altmode[0])
                ucsi_altmode_update_active(con);

All other call sites are already guarded by this condition.
Besides, I don't think we need that comment above.

Thanks,
Andrei
