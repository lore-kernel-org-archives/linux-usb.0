Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558DA3C2796
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857562; cv=pass; b=SwJRi6xJe93+y3XrgBHmWNwBMQZso4ekMdOVrM82io/LKq2kFzTv9IrlKv+974T9X+9H4rADwougp4gunEo26zch2Jpq9d/qKy9NXYEajuE2v1p6afpEVky/EaM9840mDz4wnfWiFS4GEbiBJvCb7rPgn4zSpdAgFjbCo8GHk9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857562; c=relaxed/simple;
	bh=x+RqhDEFCJlDmSwDf7GB3PDW2yVZPJ21uczV8t+z28A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evWDyNUXHJ3wgjH86j9XpNlZUGSrNkB2upBZDzO7kFm5pKTAXRWxt2+9Fwhz681sBNGhoGCpir7dIbjaUC3/qqlG8KJMf0hv4JBP/jydK4jm94vsl9xGWUTpQQc5hYBW1ZuyHPIhdJ2brQqb6x30wTyH0QwV9S+s2hlOCj+a6Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nq+DxrKU; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nq+DxrKU"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so4265631a91.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 05:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790857561; cv=none;
        d=google.com; s=arc-20260327;
        b=R+38GhgbLnd6ziYd3ccnx53DNJnTo5eH9WFVHiiSN0lW/zLeO1zuulioRIIsO+eWf2
         tqbakabu60aQhXJOR6Nd09pL3s4WY20FwjmAD9p6OvILEo5IAwOXGrXzoUENEL1+fxmh
         k1rB+TFJ0V8xAmFoj+trXIxxYr2T7pqiPjoMYJWZbhXd8flxcgW10D4AsncONmejb4hc
         sQ4hhHpn+unW3NDm7IQhx+9ktLY52e9787jLFuVgZ8yU4jDhI8CkpQePRf5DnMemnqTe
         eqwCbb1y4vXtp+omH82Ht+YZAqNKnTdKACOoWpfrNcQCgUqtCe9kqk0Km+JYxo50QVIj
         VtiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sHNsjDTZpfGR2H1l2JsSr6KfRDIP/MhvrrYNRy/u2yY=;
        fh=yDwDCrHB1ijMiJVDmh8Rxg1DRLMe8nhxuQC/06/6X/w=;
        b=nXcmaDFq9kcox9YJCnp00n4UidUXXTSN1UYxkXD5Z3GgeMFQ0H/KGi5+ipoOXtQ6qC
         aZkxst8Pd+pIwp6g79UakigZkCE3Dv/BFv4wPtsvWS/aF/i0OygYYrw6tNMhGyk8kKz/
         NaD7U+FbwIxlMvg+EoxCGWeobpV4cIlVnIgLR5rOE5iGVvPlXTE5zwN6Z7lBX1vRUEqf
         5jQcKL5YG/TUPqB4Gnh48C628cgf8nDRBDdO3T6jFHGPGlFMzrJCkuTd1UtAf3dMOQWB
         s15oQdX4ebtTxv19CTKq+RIHG7VVS2uXYhaPy8XAp1ZsTRH2l8FTk/SrJDQYZKaliyXt
         yNQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790857561; x=1791462361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHNsjDTZpfGR2H1l2JsSr6KfRDIP/MhvrrYNRy/u2yY=;
        b=Nq+DxrKUGKvNs17iv6Sgu9y/wyowD8TUW2b8lFLAfbZ6EKrhC3y36R3f4S0FWC1l9h
         HgB4JDn6J7yeS5Zf+HcChijIPxP0YhzWy3L8u1DKpaXSEhCe88XuuTzo21cAgmCJ0E12
         5Zj2+N2vg5ysSbyGQKKfAO01O1hYSX7ogzA0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857561; x=1791462361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHNsjDTZpfGR2H1l2JsSr6KfRDIP/MhvrrYNRy/u2yY=;
        b=P6XGp7Q0y7ZC7rKWMLVoBuGXHEPmbI+40TmizpiEzOvfeLdo1+J23Qi03XG2as/4s+
         NYzi8I7hX/EFEGKbLdgq50U3/AXXc57KO0qyMfpugNlAtWnRpuYm4UIuokZK7ndGdtlM
         tD6HsQT9LPGZBoBTDdrNJrAfa8r6InH8s0XADECUrr9h6f6fbEuSCIv4U/ZiwOeXRTnv
         S8kQpG4obSxsS6+TtWAhVYBttPXQM/fi47kI/e0aDNWdKnf98H2YEFJ7/6L2MWKw02iM
         3xARKbebqkYqFMLokTRzR/KiVXeT7mNyhR7gb0r4g91ufxv2IpVzvBXAzPDQymmRVgdm
         wSqw==
X-Forwarded-Encrypted: i=1; AKwUvBwyQoYytwDhtkac3nfPW8P9Gz5ycoObf9mX+ZPmVRHMMcuSyNwOSqBqDtAIiiO0fTrYJMJk4K7jSaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrqPyQ1wOPqGrK9LtsztRD24RaPQlOYlHbo5W1r3wffUhF8cqi
	bBXKIt9pA0NRVmzAZMYn+6h874Qr3m0QaJ2+8F4WG9BK/2e8fNIRt+FpO8uMI4nKJenKt7W6wrr
	zcxW/rlSOEF+nqtfSonMMWs+AhkFT/jG3/d6/kleKcs3xrkdRiD4=
X-Gm-Gg: AYBFou1BqCjNFQo+BGhvsnFmBngP1WPR+wfPMY2xu4NNrq0fEYePCZ/rU6OwIdHZPQ1
	U1NtLdfyZHJTrXedYowE4jbaxfubmKv6qip9EQsnlRuMPckJB2MVAxGf62Je7aiQPhPhwqNjgTz
	6oZqYZPAZXSl0ZSRGxcMc56WaSj8e9HYHhEKWA19s/GrFW/EiftQ7f23OiCQoRFitIc9ZcIx7Xv
	JoXLR6IpAMFeeDItJmBW/TUnWc/HUDjgNGySTPHC6oX9Y+65k0S3jZbV2MO7pW+HHmESN0wpHM9
	xihjoGYCwcQ1Nsrj17b2mRL0eVj2TdzIxBDFUcIb3CXnrPLofkRDOnVjHF6ekopnE0cp11+KVBu
	8CK3sY1o=
X-Received: by 2002:a17:90b:2787:b0:3a0:bbd8:5ba7 with SMTP id
 98e67ed59e1d1-3a4d19263b8mr3982449a91.62.1790857560613; Thu, 01 Oct 2026
 05:26:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930234611.468765-2-cnfourt@gmail.com>
In-Reply-To: <20260930234611.468765-2-cnfourt@gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 1 Oct 2026 12:25:49 +0000
X-Gm-Features: AclHuK-BxU7MmUHAcZP4PHaPh5sL3Kfkf4dW_oEhBdzZNS6_OoOhRdYuvai3_LY
Message-ID: <CAMMMRMe1Nph0cOtVsJcKGJgsnNarj+9fEizMh50RqXZP+cHoPQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: ucsi: Skip CAM query when partner has no
 alt modes
To: Gris Ge <cnfourt@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Abel Vesa <abelvesa@kernel.org>, 
	Pooja Katiyar <pooja.katiyar@intel.com>, Jameson Thies <jthies@google.com>, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 11:46=E2=80=AFPM Gris Ge <cnfourt@gmail.com> wrote:
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

Reviewed-by: Andrei Kuchynski <akuchynski@chromium.org>

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
>
>                 /* Complete pending data role swap */
>                 if (!completion_done(&con->complete))
> --
> 2.55.0
>
