Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522508;
	b=5KZ/ow42Dt3oiNj+Z5ov1U/AM/E2A9sVseSarY2zMXhq3CMQQLUoOsJ8iNQ7ojw7R0xY
	 DYldj4L7SOvzFjBq2YFz6Y32TM6WSa30aAvglxVa00JMVtFRSaP57BFC4yZTpBV7g7gvD
	 wRyhtMa/3OfvojnK14DLf6JIPT5KAHV+whkcnUb50LB1zwhFkf5ot6lsp42v3YK2eiW1N
	 8m6EWYXahpn8mycDWx9BDh20zK3xHowHaPNi0xbxlBpG5S/NBJEcq8zEqFvI5VrdsZADm
	 KatwCJ2O41JDoHSLjJ5w60Bo+m9FRl6TfxogoQwNQF1tZK39oJ2DroNgu8RUC8HQJJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522508;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=No2KyXk9MUMxhv4447XBXIAiL0dUSuR6WOTk+AWlCDo=;
	b=avRkprb94fwNyNYj81EZAJ78D8DJpCBcoV7TVd0m2DBfOPQQkO9w6146KBYZVLZ3OqF3
	 mO0y2qg/rJvCFNSUzb4qja6pVqjrQq/Y9diK2J8S6onT2Qw0ehhuK5jVcR8V1NuMYSljm
	 IK7tFutW1IyfKchwbagDc849XLRnO9OSx0hnbQpLuJKc8maL0LKai91DK4ZsD2oGGpJ89
	 ZnrrEberZdOXjqbl+qpIKQmjSrgK1AbsAgZAYyX46iRbrmsdf+qQHNMEgwuW88MlT1htn
	 GMQqgVUSXEMeNj0wLa9n11YnfALqH0cj7x9o1WjhZ74m2C3YVYeAIBYh/2sPd4ppNYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fXlHkY5S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA94606A327
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 12:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fXlHkY5S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDAD1F000C4;
	Tue, 24 Nov 2026 12:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522507;
	bh=No2KyXk9MUMxhv4447XBXIAiL0dUSuR6WOTk+AWlCDo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fXlHkY5SxmDxwjnbTGFJYFShLPzT91R9ccBrBD4eJFic6PYYRT+gk0YeGrhEZbIc+
	 vlQjRqAuCEtNMOab+h2dAkDWPdRKuiWv2+cYBILqNSol77rIE+XThSHDm2g9xxzxi5
	 lBGYyaEY40gnPWFAfO6Nap2wwYvRdDLDYnRkxNTzuSRin9u+bxeLen/2YiR34uW0ou
	 EBtasdSOvfX07OJr8cnaIxQ/BChN++YPm+MhhVyRJDXZn8iomQrT7g+bbd3GMne8Jg
	 dvgy40t7r1+d1sUS60i2p423alNxZ3fDelw9Q5+rxyHMD0j4sgFbFko4iEooeJiVeY
	 WeQAd12FYTqVQ==
Message-ID: <sashiko-outbox-231112@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: typec: displayport: correct DP sink
 plug/receptacle pin parsing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jignesh Patel" <jignesh1.patel@intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261124115241.2956206-1-jignesh1.patel@intel.com>
References: <20261124115241.2956206-1-jignesh1.patel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 12:15:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] usb: typec: displayport: wrong DP role pin macro in
  dp_altmode_configure()
--

commit dce41c371c3e05eb264489df01883dfe3fa7a213
Author: Jignesh Patel <jignesh1.patel@intel.com>

usb: typec: displayport: correct DP sink plug/receptacle pin parsing

This commit updates the pin assignment macro used for the partner VDO in
the DP_STATUS_CON_DFP_D case of dp_altmode_configure() from
DP_CAP_UFP_D_PIN_ASSIGN() to DP_CAP_PIN_ASSIGN_UFP_D().

> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec=
/altmodes/displayport.c
> index 4a566388bd6a5..35918eb023c1e 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -114,7 +114,7 @@ static int dp_altmode_configure(struct dp_altmode *dp=
, u8 con)
>  		return 0;
>  	case DP_STATUS_CON_DFP_D:
>  		conf |=3D DP_CONF_UFP_U_AS_DFP_D;
> -		pin_assign =3D DP_CAP_UFP_D_PIN_ASSIGN(dp->alt->vdo) &
> +		pin_assign =3D DP_CAP_PIN_ASSIGN_UFP_D(dp->alt->vdo) &
>  			     DP_CAP_DFP_D_PIN_ASSIGN(dp->port->vdo);
>  		/* Account for active cable capabilities */
>  		if (dp->plug_prime)

[Severity: High]
Does DP_STATUS_CON_DFP_D configure the partner (dp->alt) as a DFP_D (DP
Source) rather than a UFP_D (DP Sink)?

This case sets DP_CONF_UFP_U_AS_DFP_D, which configures the UFP_U partner
as a DFP_D, whereas a UFP_D (DP Sink) partner is configured by the
DP_STATUS_CON_UFP_D case right below:

drivers/usb/typec/altmodes/displayport.c:dp_altmode_configure() {
	...
	case DP_STATUS_CON_UFP_D:
	case DP_STATUS_CON_BOTH: /* NOTE: First acting as DP source */
		conf |=3D DP_CONF_UFP_U_AS_UFP_D;
		pin_assign =3D DP_CAP_PIN_ASSIGN_UFP_D(dp->alt->vdo) &
				 DP_CAP_PIN_ASSIGN_DFP_D(dp->port->vdo);
	...
}

Using DP_CAP_PIN_ASSIGN_UFP_D(dp->alt->vdo) in DP_STATUS_CON_DFP_D reads
the UFP_D pin field on an actual DFP_D partner (which is 0 on both plug and
receptacle DFP_D devices), causing dp_altmode_configure() to fail with
-EINVAL.

When a UFP_D plug partner (such as 0x00001c05) reaches DP_STATUS_CON_DFP_D
(for example via ucsi_displayport_status_update(), which checks
DP_CAP_UFP_D on the local port VDO and reports DP_STATUS_CON_DFP_D), this
branch sets DP_CONF_UFP_U_AS_DFP_D in dp->data.conf.  That configures the
sink partner as a DP source and causes get_current_pin_assignments() to
check DP_CAP_PIN_ASSIGN_DFP_D(dp->alt->vdo), returning 0 and breaking the
pin_assignment and configuration sysfs attributes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124115241.2956=
206-1-jignesh1.patel@intel.com?part=3D1
