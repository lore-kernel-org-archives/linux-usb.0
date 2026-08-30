Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE6C1DE894
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788082400; cv=pass; b=mci3vtQ/FaMbWA2Tw/TN3GjAfa2bDEE2kJjcffA2kVOctSrRZgTmEU/YGi8eUTdHGAnnjjqe1MUAao4NRsuOYg37yTMbaiqItN5PzZueLcns3yuYyk7u+uEaTmP2H9DVB/6i1k64rczdFWBHYIjkYj2Czf3INHE7/ADyUJ1Gr8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788082400; c=relaxed/simple;
	bh=XjkYzubNknDxtSLcJD0OSIc3FWWZftOwgASfjFMJ1JI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bP/6TVNUBgoxq5vnhxwaQEMOnMKPSaGQute8BQP4jMIy7Vso3Za99rVGR3LCoIE25r95wgaCimXPgyHKPLv7JoxBALTz90jXGAF2Wrdp9FnKQxvKb3pSG0C5X5lYalKVaMtCU89MnU1TtTzCSP51TOkhSCsv80Rf7MxVCGtn5Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2531f453eeso387832166b.3
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 02:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788082396; cv=none;
        d=google.com; s=arc-20260327;
        b=DhoeAd+s6cnqAllW6OpV4fu4UogBz38MT/R4MrNbC9CXlnZezDv+vZeT3fEhmYq40t
         3WCITin0XMXUm/mL/+tBrO/gzpLM2Y/lRc1BxSvir5DV0TbJTHO6NEPRmTYyFwvV044B
         /pEBP5SySV8dnIlphCj/oNqtiM7PfTil4YQo4cJBeu7zJoETNFMsN4FwtzOvsKnSXAkO
         Zb5NUx7maGU12phKdAR4feNYZk2uti8jpEKhBR1j9WjY51a90w9riYwlu7BNlYqDkgEI
         p/r7Gab4wmYh3IX8n9acZCirbmtZ4gLjaLCSu6Po28Hm3+cl0kJurb/Av5GsPLCL1ay7
         DWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=4S/Q8LsIlAtco+cE6yiBQGlAUU2xKF533bVW2yFHbcQ=;
        fh=8TquWwlyQ8yMQbWVewV9fDlePD3DPpZOAigMTaz3Sp4=;
        b=ay23snTWC1uGS1u+tjjEb615VNWwDU6mWq3UA/QxeanMWtSSrcnPVuoMQI31gXuy4S
         zfhaEDP9ScV/+2eL195xKq5MKcYLgcFFUScc7fp7Bs6IItsmq1TxTnGTCVFiONpX+iFO
         vgE1W+c28UVj9hZjKQrijGuCN/GHaEDTF7WpD8cIoEqy8P4MY9Zfa4oQ9+VoPiD5CG+h
         i/MUYGPwcTQgBQokepf6/XSgKrs++dmXFmWnlP1M37BU3QfNVJU41jO9TyvjnpCXdZWN
         0CFtQTVbp0I6+EshESkILPlw5OoYGEoGS+v8MsDBuO4h6eNsXEDXVSe0tNoDKYNGxAgH
         qdCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788082396; x=1788687196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4S/Q8LsIlAtco+cE6yiBQGlAUU2xKF533bVW2yFHbcQ=;
        b=WV5lWTzY0K1Bn1dTlOTHyylwnDY/br86ftPZZqoZqRtYM/0hUOmU2c6/XE5748W/LY
         d5ANm/oeNA5PDX5UdBtAD01rPF/fRInq+h7nJjOn1eeWNlKQsPr87fZLMbKDIyM5y+t7
         EvlzSVCHiZrvEVOsBsqbqy+Nw/ej/lTG6ruvnc+7uAjktsS507SdWiRL0HOVxIQf0l1A
         m0nOZ0Z5LGN9sR30H0fAT0CfNIcP2fnv/H/hnbCHyEzSYAEb8kovjYbyS/OvH4YYN+W/
         EIO2/21nP1+YBo40K++toM+cXP0LnNdgh0XNBOc+lkbT7n9WDyRBcBXYGxQRRTG+cxRB
         zH5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrozx6ykFOUWvKUAmPnujgzvateWuf46Q8ridFlAUWwwCNx0vws8RizlrUSHFFmRiUOPOKg5kRj/BQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lxxJ9dSy/i6e5BBbOxG21ePK4mlx2xZzDHEDjecPbZPZ+KNyL8
	wr6CaUw4YdciM2rZX8PjHviPKU2aJGfGrIAt7H9RzxB+rBZC8sO0o8B4QKKVPDPFSd0oNypjrjK
	jhl2kzAeda1b6Avzm8cjMPW83R0iwAiM2xhbWX/NR
X-Gm-Gg: AR+sD116GVudJVgD0iOlpPMdfHAVz4mSaa+zDdKn3n+V9tAnd0g68+1pgtErOze/EMS
	b3iyDmsA+Q1fouIUsyQjafqC0tRQH/9EepykzsNi63Q89RAFhQVS1tI8U/XmzMqNVSGn28XSvAL
	1mlp5tNwDBXA/bKXr5cZ/8ehTu8G3PrZVXHG2AjPjCl84SvdTe+5U9cVBSh7HmmjHkgR0uqE+C/
	9iNSU5bm/HDjULxLOiyAJI/n2okYAT6tf8k2k/90Huj7ApcOZOV96+hvSsd0muxDIDUvxby2rSR
	n8TbiOhkU+LJw8GwQTQ2ZxbuaQba63EqqTHOHmEAuDO6KRt8pXw81MyVlXdC2jPNOexiRQdLxPt
	8EP6QdvkI28gGO4rTDktCHBVbTLsrgboRYac=
X-Received: by 2002:a17:907:7a13:b0:c25:2e93:289e with SMTP id
 a640c23a62f3a-c25571deb5fmr1292724366b.16.1788082396393; Sun, 30 Aug 2026
 02:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com> <20260829-xhci-no-soft-retry-v2-2-0efe22f1c2f8@divinehawk.com>
In-Reply-To: <20260829-xhci-no-soft-retry-v2-2-0efe22f1c2f8@divinehawk.com>
From: Matt Eaton <linux@divinehawk.com>
Date: Sun, 30 Aug 2026 11:33:05 +0200
X-Gm-Features: AcwNN1XMIbCJzCRFD4Hg1pCFjnrmfyXU44jNCBVbq9X8JPUOmt7-zWV52VzJ6iE
Message-ID: <CABUBpLfK=w6e-M_TV4BfwX7EsUCLaZO7_GN9_506yHvBFEWJEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] usb: dwc3: add xhci_no_soft_retry software property
To: linux@divinehawk.com
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 10:04=E2=80=AFPM Matt Eaton via B4 Relay
<devnull+linux.divinehawk.com@kernel.org> wrote:
>
> From: Matt Eaton <linux@divinehawk.com>
>
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index c5674161b2b0..e22a8dc5d090 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -130,7 +130,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
>
>  int dwc3_host_init(struct dwc3 *dwc)
>  {
> -       struct property_entry   props[6];
> +       struct property_entry   props[7];
I think this should be props[8] now as it should have been props[7]
before (latent bug?), with the last entry being NULL to satisfy
property_entries_dup(). I can do a patch v3.

Regards,
Matt
