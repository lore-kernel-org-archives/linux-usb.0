Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F491DE8AE
	for <linux-usb@vger.kernel.org>; Sat,  6 Jun 2026 16:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780763867; cv=pass; b=QnjB17YMyb3hRV8ZCDDPHhp/FTmD5MS9yJ87nuy7x53ftRFL9pzBXw5DBbzJPC83tRhboYR/48v+d9xBBn2PszwMRa2Hs8GtKuu4f8HOWIosJCpE4oEF6izZSoyweCRmRnzDASdB6DhVOmx66jkNprVGf+ckJ8QKNRQfqeGIF/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780763867; c=relaxed/simple;
	bh=1m1fLJCRr6YYTydIDu8g4fCrnuVqlHxq36j3/YigGLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZExSP5uFA2d1Mi5RSfq5ZxfR2oMZOzVY0Lf2g4XPtIkryBlg4sq4c4O47B48GpRz06p9cK6o8MGvZmlmWCHhoPygQmToIfiPVUNNUOIs/uLSWc051QagLpuAIgWFhHNYu/6z/i4W3qvE5w/TrY9T4YloTU3rjz83gEdeASpmbVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qkqJXM8t; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qkqJXM8t"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-43d23173511so2000127fac.0
        for <linux-usb@vger.kernel.org>; Sat, 06 Jun 2026 09:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780763864; cv=none;
        d=google.com; s=arc-20240605;
        b=gAhMUpHYXSyKodwLvtb5/73yUij+k9EvguY01xgp9fKLtK97BkZ5RGev9KhamKezOd
         +ipPXXO6Xr09lYksMCVIa7AEpnexCaFcAuQYsiX7blMNaPJWucybkbpT1ZtqUp91h/9i
         N/kYOql3JsCgUkF56WNvxjFkQ20Qi4pj58eoLbRh7tvyMUYVIH4yrZArrkGLIcTRxsp5
         FPjysWM/kh4hEytCbIRG/rIiNcz3KUfp+bwqQGHjpj/YUclqali9fiHL0lbiA3rNfVdd
         tycKROIPcQ9GXrSeviKwrLAVwHkX01U9kMbjBaixvXIP4YacMSl/jwDtwY7fSgPbGZm8
         7VFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7eeCV9G8OljNy1OtrEzhE/4VM3x6HilpKJCM4bFEJxM=;
        fh=PlUKGWgzDadS0dg0rYf6Ky4XF6yzvpx3NSdMHOOxKnM=;
        b=H5yMRH4YHyvilHFT6Pj3bA66fQ4QSyHeG0aJjuXLDMRtO9Tc33wuKaf0KhErtmO7Ar
         eaAQpP9iEXtme7HN5Pkxs6zuQ3R4yR8SSsVbdy1HIHe9LNrm+jLOWLwLZ/rYUts1V4wz
         eLVCQv8BoWdicvJNdBsu95nW1XO9l3h1ebmBz2fJbutCry/uBffIAqvrc2WKToAxToKb
         fp+EwBu5AS2ddpK565JLHPInSxpS1DQAaupL8MoxZYWVy8nmEvtwMNNNkurK+4FR6SGA
         YfKIpgvRo4JSrQ/f0/vOVtJ8UYHMAsAQyn0XHuACramRAIjvSuY9OUJBMt1mOnR/HhTi
         TCsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780763864; x=1781368664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eeCV9G8OljNy1OtrEzhE/4VM3x6HilpKJCM4bFEJxM=;
        b=qkqJXM8tI3KoiXOK82fH7wbRBjwXM2asFrDDPjPrJWjQ2ByNRrDALE3yZlGbcYErF/
         G5nn/Br0oxgQ2x6ty9E3iPHRyUuIoAq7sjE+gyBsf6KXv95eNHWNEcxb8xfkT3x/xR+7
         myZLhHtD4paP+uNSMAPgmtqCj7rsiTF1FfKT5gaNwpbpo7kwhDNc8rvXC6HnaoBP1V9G
         fp9pWFbhkICxvflrBVhkubPUfFmKI5KIYcwcbZYIyFL74b5BXS2WSnikVL9J21QqEWrU
         Nv5JyBuqGDasuoKqVYNxhbSXKpfI2yTILa8gydz/04WH63+/GfNOx8lML2HG68kiXefC
         Qtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780763864; x=1781368664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7eeCV9G8OljNy1OtrEzhE/4VM3x6HilpKJCM4bFEJxM=;
        b=m018mMigdQ1sBkNJbuuN64x6D/px+KpW2SOcb9A0WYDJD93yB3J1/r/NH4gxjzM1T8
         JDRLEUhPZnup7L3Flc1tdyDMmwdpOKUpPePHfraebKg/4TTwLffBqJMTTLNexI9AuF/G
         TT1SzWlRfrhFhcoxCN8QUwIGCwHdk5/baX8f7RnuorEd6boAN8EwgB0WwZH9qiy+i1te
         8HZ6BozlFm/ltWyxEWzkc9b+5qs5gpIE9EesGxOzySC29KYZM8Kd83nwSiw+AGTya8z9
         9Zl81Cp+FqD8ysqej0J0m++kFMFuULsxcg4vDFGlCqGibYnZyrsh7XaBAQ41KmnBqPMR
         asNg==
X-Gm-Message-State: AOJu0YxSon11zSoXfIH/JccXui5MdKNeJRJuyg0u59Nr9hM4JLFm34+c
	Mf7GrE9/JSqK4KRVNK0QCaV+sfQdvyP1Qi7Lt8uvKSTh+Pf0eDxw16ReybNcBu0WETYvvJzoQsG
	QXytax+j0WyUcX03Qr6C+4s4HTH0LnfuAPur/nR+BefXRd8EOLJat6qw1aAs=
X-Gm-Gg: Acq92OHusHZM1PJlMhUeSmZAoNw17KrjppCEfFHHo1RjyaR7/n1WAzkicCYlCDzN3yB
	6uX2KCnmsv3CACMUb5SIV8i1JRMrG3kPGrxN0qVuK8LX4V9iTUzwFZdCGX6YYPyiVwg0zhYlLk5
	chA3kwUAXFWEcjE+R2NX7bR+14l3mCqnJM0xGh4JQ6aDLQq8PlNyxII0v4GgmxDShUE2hgGg4bj
	/noXK35A4/Oe7EqrWsOL8sTKODuasYT+qgStYUZwtNUOy3OfU/np14Md9wrP9PwPL4Wd7YJRIMD
	jBVsT1L/hlP5SaxeLi6AfeeASAu3K7K22fWo/leBuUU4AbUuBg==
X-Received: by 2002:a05:687c:20d2:b0:42c:5ca:e7f7 with SMTP id
 586e51a60fabf-4413d855584mr4886340fac.23.1780763864101; Sat, 06 Jun 2026
 09:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518091513.3277975-2-cy_huang@richtek.com> <20260518091513.3277975-3-cy_huang@richtek.com>
In-Reply-To: <20260518091513.3277975-3-cy_huang@richtek.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Sat, 6 Jun 2026 09:37:07 -0700
X-Gm-Features: AVVi8CflpMdYVRyd3Mz9Z37Tye0owHXyHPsAMOQDEulCsSkQmrUSb70gdrNxOhw
Message-ID: <CAPTae5K2aZ8=8X_7OuDr--4OnkSwe-=1+fb220f8800ufBs2gA@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: typec: tcpm: add low power mode support
To: cy_huang@richtek.com
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, lucas_tsai@richtek.com, ren_chen@richtek.com, 
	kevin_hung@richtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 2:18=E2=80=AFAM <cy_huang@richtek.com> wrote:
>
> From: Lucas Tsai <lucas_tsai@richtek.com>
>
> Add low power mode support,
> enter low power mode at detach,
> exit low power mode at SRC_ATTACH_WAIT, SNK_ATTACH_WAIT and init.
>
> Signed-off-by: Lucas Tsai <lucas_tsai@richtek.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 10 ++++++++++
>  include/linux/usb/tcpm.h      |  4 ++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 55fee96d3342..a4bde4c292e4 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4939,6 +4939,9 @@ static void tcpm_reset_port(struct tcpm_port *port)
>
>  static void tcpm_detach(struct tcpm_port *port)
>  {
> +       if (port->tcpc->set_low_power_mode)
> +               port->tcpc->set_low_power_mode(port->tcpc, true);
> +
>         if (tcpm_port_is_disconnected(port))
>                 port->hard_reset_count =3D 0;
>
> @@ -5181,6 +5184,8 @@ static void run_state_machine(struct tcpm_port *por=
t)
>                         tcpm_set_state(port, SNK_UNATTACHED, PD_T_DRP_SNK=
);
>                 break;
>         case SRC_ATTACH_WAIT:
> +               if (port->tcpc->set_low_power_mode)
> +                       port->tcpc->set_low_power_mode(port->tcpc, false)=
;

If the callback ends up being absolutely needed, then,
Instead of calling set_low_power_mode() here and in SNK_ATTACH_WAIT,
you can invoke it in __tcpm_cc_change() in the TOGGLING switch case if
the state machine is going to enter SRC_ATTACH_WAIT or
SNK_ATTACH_WAIT.

>                 if (tcpm_port_is_debug_source(port))
>                         tcpm_set_state(port, DEBUG_ACC_ATTACHED,
>                                        port->timings.cc_debounce_time);
> @@ -5439,6 +5444,8 @@ static void run_state_machine(struct tcpm_port *por=
t)
>                         tcpm_set_state(port, SRC_UNATTACHED, PD_T_DRP_SRC=
);
>                 break;
>         case SNK_ATTACH_WAIT:
> +               if (port->tcpc->set_low_power_mode)
> +                       port->tcpc->set_low_power_mode(port->tcpc, false)=
;
>                 if (tcpm_port_is_debug_sink(port))
>                         tcpm_set_state(port, DEBUG_ACC_ATTACHED,
>                                        PD_T_CC_DEBOUNCE);
> @@ -7489,6 +7496,9 @@ static void tcpm_init(struct tcpm_port *port)
>  {
>         enum typec_cc_status cc1, cc2;
>
> +       if (port->tcpc->set_low_power_mode)
> +               port->tcpc->set_low_power_mode(port->tcpc, false);
> +
>         port->tcpc->init(port->tcpc);
>
>         tcpm_reset_port(port);
> diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
> index 93079450bba0..475c5d478c0e 100644
> --- a/include/linux/usb/tcpm.h
> +++ b/include/linux/usb/tcpm.h
> @@ -82,6 +82,9 @@ enum tcpm_transmit_type {
>   *             Optional; if supported by hardware, called to start dual-=
role
>   *             toggling or single-role connection detection. Toggling st=
ops
>   *             automatically if a connection is established.
> + * @set_low_power_mode:
> + *             Optional; if supported by hardware, called to enter or ex=
it
> + *             low power mode.
>   * @try_role:  Optional; called to set a preferred role
>   * @pd_transmit:Called to transmit PD message
>   * @set_bist_data: Turn on/off bist data mode for compliance testing
> @@ -155,6 +158,7 @@ struct tcpc_dev {
>         int (*start_toggling)(struct tcpc_dev *dev,
>                               enum typec_port_type port_type,
>                               enum typec_cc_status cc);
> +       void (*set_low_power_mode)(struct tcpc_dev *dev, bool enable);
>         int (*try_role)(struct tcpc_dev *dev, int role);
>         int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type =
type,
>                            const struct pd_message *msg, unsigned int neg=
otiated_rev);
> --
> 2.43.0
>
