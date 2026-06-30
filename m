Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5724192EC
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828975; cv=none; b=RFBlfbLsxV7cXGwNE4313+WV2uC++Pwt8Bf6cHnSRnwqLxQtEnnDLZ14XP+t6eGX0BRlTHAaMGCtQZ+hym9Y3KKRr6DoQj5CnZTBQ+Pa25veKK1tm1DF7r0pgyyexuA8fFvrvFr/lA9/9hTnAeNibOuvEp1bQHMVo3JRLdeNfiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828975; c=relaxed/simple;
	bh=8a49eYhJBmGGJL4DTQ8ljjSVdpg2gAW44CdGcIU02lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkFmXgvTUBldVaidcs19fIXZn3NrU4EqTtTBCbxO0rmvg0VNS0ntDy44FecYPYKfKMIoQWASjesQ+TgvT9ofOdHYwCj13BnK0Lsb1rxPGR8HARSFqZN/O6UPF8vAizYteaE5N2AXVeJ1EGwtz2U9PWvzfkh0H8luuMoFnLrmfm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oDKXMTvU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oDKXMTvU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9091F00AC4;
	Tue, 30 Jun 2026 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782828973;
	bh=WHilBg0BLpUEkVELRD6upvYHW1CiOKHc070Bsmr3qD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oDKXMTvUkXkfKTZ8qGUI5Iw4rnjTZUP16oHWtRtRgYE1Vj5tNISbcCLo/mziD15c6
	 0UvX2VAvzqXEtSqRqXM1kgPMjVCPRoZgunRPO+mZBDBQDPApiYaKXBq5GFRgVN9NLc
	 cJ57Lu9LFFiWEDQ9V9yKmJ+ot6QCiP3ZnJ95gW68=
Date: Tue, 30 Jun 2026 16:14:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: DongliLiu <dongli.liu@outlook.com>
Cc: linux-usb@vger.kernel.org, security@kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Fix potential stack buffer overflow in
 altmode registration
Message-ID: <2026063016-choking-flint-ccad@gregkh>
References: <KUZPR04MB8968032AEDE5FB1CCFC62D5985F72@KUZPR04MB8968.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <KUZPR04MB8968032AEDE5FB1CCFC62D5985F72@KUZPR04MB8968.apcprd04.prod.outlook.com>

On Tue, Jun 30, 2026 at 07:33:09PM +0800, DongliLiu wrote:
> From: DongliLiu <dongli.liu@outlook.com>
> Date: Mon, 30 Jun 2026 19:32:00 +0800
> Subject: [PATCH] usb: typec: ucsi: Fix potential stack buffer overflow in
> altmode registration

Odd, this shouldn't be in the email body.

> 
> cap.num_alt_modes is a u8 hardware register value with a range of 0-255.
> The altmode arrays in ucsi_register_altmodes_nvidia() are fixed at
> UCSI_MAX_ALTMODES (30) elements. Without clamping, a malicious or
> misbehaving hardware could report more than 30 alternate modes, causing
> a write beyond the stack-allocated array bounds.
> 
> Add min_t() to clamp max_altmodes to the array size, preventing the
> overflow.
> 
> Signed-off-by: DongliLiu <dongli.liu@outlook.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index xxxxxxx..yyyyyyy 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -xxx,yyy @@@ static int ucsi_register_altmodes_nvidia(struct
> ucsi_connector *con)
>      struct typec_altmode_desc alt[UCSI_MAX_ALTMODES];
>      struct ucsi_altmode orig[UCSI_MAX_ALTMODES];
> -    int max_altmodes = con->ucsi->cap.num_alt_modes;
> +    int max_altmodes = min_t(int, con->ucsi->cap.num_alt_modes,
> +                 UCSI_MAX_ALTMODES);

Patch is line-wrapped and corrupted and can not be applied :(

And no need to cc: security@kernel.org for a public issue like this.

thanks,

greg k-h
