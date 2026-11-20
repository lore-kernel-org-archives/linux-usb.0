Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190886;
	b=lzB8p6Zw/e30T62rna7+rOvhH7Zw9OJTOvf+zUSFox+WACKzOU8JclyhIYSiucCOIYC0
	 yCRKdmfQ8tIpAFaR5QKJ+nFtYxS/JcqzDPyfkKAGNhFll6KUNIlVQgieO8YzDu2gsbKA7
	 C8sRd24HYVScY7dHVDKniz+UmMrqtHkKOf3WLFEFkcIpdXtrOaEIBRkU0GcNrwtE/iA8o
	 3HOFHOh4GS2G+9p/opEvQf/NZcev11NviKMmvVjWHV83HfJxZvDxQR8AFnQmsiBN6iVTL
	 /a+OMxaBtQlKvJvZwwZ6FXqcRZrn6gejqZHgriWfiXhg71nUF7wWF877jb8ZQXp3lhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190886;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=J7kbxG/bU7Az3Ucje7pHCgFm1c686s5SoBEkwkvio7k=;
	b=rxzX5Z/wrmxUcCnuV5905eGnHLeQiFxtD/oJYs5ULCTS4bhBsJP+nWZ45kjd71eMtO/h
	 tVxq+wK7T9VWBPc+nQfO08rSqOz16TiWbe2hBubpkyydrNeBoWFuHmtemi68ffazehDlH
	 LOcQuGyTtyIAWjH4PZxJm2o1eFVarXsPgqhwt3Tu6AqIsRDle4+41fY2irpVTc86l9PHb
	 mS8nmyrNyEESy06Ctq9jeGWskCtdkc4WZ6Ci8UnvkDhSStenx8C/KIAjrl2uhIQ/WmFmW
	 Ba8jg0wSXLwtN4zXhyMdZdkqJzjQL3Aj3hgj42n1D6b98gqaWrwvoo8QwMPM9NdBsbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=KPJqciab;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900C8606A331;
	Fri, 20 Nov 2026 16:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=KPJqciab
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878BA1F000CF;
	Fri, 20 Nov 2026 16:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795190886;
	bh=J7kbxG/bU7Az3Ucje7pHCgFm1c686s5SoBEkwkvio7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KPJqciabu5Z8Hlaje9eyfTqZuGUEg4dNS1U7+hm3DX+luTP985eL2maIEFvA4Isj6
	 9fzCfxytuPB9NaODBKrhf21VyMGDCnSNqd3cXfe6er6aAa2NrTvHL8pwtWtjTq194a
	 aeuvdaHL60wX1jGVYTlmF77bR9H0s/Bgh6pSVXuE=
Date: Fri, 20 Nov 2026 17:08:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: quirks: add WINDOWS_CONFIG_REQ_SIZE for Razer
 BlackShark V3
Message-ID: <2026112051-smirk-omnivore-0d65@gregkh>
References: <20260831191345.43869-1-memobayoglu2007@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831191345.43869-1-memobayoglu2007@gmail.com>

On Mon, Aug 31, 2026 at 03:13:45PM -0400, Mehmet Ilhan Bayoglu wrote:
> The Razer BlackShark V3 and V3 Pro wireless dongles fingerprint the
> USB host by its configuration-descriptor read pattern during
> enumeration. Unless they see a single full-length (wLength=255)
> request like Windows sends, they refuse to bring up the wireless
> telemetry relay and battery, charging and EQ state all read back as
> zero.
> 
> USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE already implements exactly this
> behaviour, so just register it for the four BlackShark V3 PIDs:
> 
>   0x0576  V3 Pro (wired USB-C)
>   0x0577  V3 Pro (2.4GHz dongle)
>   0x0579  V3     (wired USB-C)
>   0x057a  V3     (2.4GHz dongle)
> 
> Both the dongle and the wired transport enumerate the same firmware
> and need the quirk. Verified on 0x057a and 0x0577: with the quirk the
> vendor channel answers and battery/charging/EQ read correctly;
> without it every vendor GET returns zero.
> 
> Tested-by: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
> Signed-off-by: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
> ---
>  drivers/usb/core/quirks.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index b5b577f0b..9b5420be2 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -502,6 +502,11 @@ static const struct usb_device_id usb_quirk_list[] = {
>  			USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
>  	/* Razer - Razer Kiyo Pro Webcam */
>  	{ USB_DEVICE(0x1532, 0x0e05), .driver_info = USB_QUIRK_NO_LPM },
> +	/* Razer BlackShark V3 / V3 Pro - unlock wireless telemetry relay */
> +	{ USB_DEVICE(0x1532, 0x0576), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
> +	{ USB_DEVICE(0x1532, 0x0577), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
> +	{ USB_DEVICE(0x1532, 0x0579), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },
> +	{ USB_DEVICE(0x1532, 0x057a), .driver_info = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE },

This is not in sorted order :(

