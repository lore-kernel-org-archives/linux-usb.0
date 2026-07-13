Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D4433555F
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 16:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959190; cv=none; b=adFG4Vf1DFYmJaQzt3DUIpLiDu/J6w4M7+MVMoF0Vb0ChY8mndwsLCEU2xRwNOPRfqLIlMS0gJH7bYwbhnBcu7AjFbQ9MsghHmtvxjiVimgVGkQ/w35ATVrZ8EvOJDlncaUQnF1VFi3jGzSPDQL9RAdctqDMtIyEwt2x+Jn68+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959190; c=relaxed/simple;
	bh=rUwgXzraRM+d0ge5jq2ksOOJxib8hk1KfqshReW3oh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUkKr6i0wF6G6ahc0pycaa3K2Pw4B8ZzjhigdUsqqqiCzs7Rl4JstMZql5c/Bz9ddqLGNo/GuPxUItwDwNjdV+EirzOm52a83kcJj+6XSSl8OD829YmNCs8o9J+RXddtaCxCo3AjnxwQab7lLYR/DQ1GvWtkYYsInXbsIvfVdmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=JC/gwANm; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="JC/gwANm"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c0a81d286so292111cf.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 09:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783959188; x=1784563988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tiKCSwRT3ewjDC3bd2cnerh5LEDNothtgTeQCFuh0b8=;
        b=JC/gwANmUWHjEGH8aYdgtHpgHOFc74yN1utIkjYtmFlOFBQg+MkqaXnaXoBqZDDNbm
         bEUPholq5CkV+gQT6TyFRzvI20Sb15uoGMgYL6gdfnlY9t8RiOjvoFH7CDELPtsUCT4Z
         rip+R46g9578/yBHMPCupLsSELySv2zGPoFl03WroBFjgnrjrvCZwTC0/hJB+zPW2Fw7
         HZHgdld4OcL9UX0OiG1MX6F5knvQ1BHGrmGO+0bqgac6f9LPZN5rQRD1gqYj4eobgNxW
         FFmFdbCAIanA0Oos1A84mR+2nC4JGniDVqh3Dm1yGCxycm8c0uZHzHWRpdfI6iv92siR
         wB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959188; x=1784563988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tiKCSwRT3ewjDC3bd2cnerh5LEDNothtgTeQCFuh0b8=;
        b=SsqqWcluqz7lK7YkPNx9Pr5f4ozJ4G+Q+ZvCpRiKc8NIlckoz2GsY2cMMlGQ5GWOLo
         IkYPBms6BEuin6n05VaNlD5+eMnkc+5nOJYisSDnxK18+O+tE8roUZ/eTdUGpPdxV9++
         ym5NO4fqN+yYIXe+bkgG5+tt/XdbJcigu3D1GiTSKciWRRMyahwex3i424cViGyGt65d
         YWYTroUZUdMjd4FchH1tx86camHlYFuRqt/N3Yee9KE0okFedtfSTXA8rd7YI9pWfbx9
         PMDpIqq1ALA/UnEAz56HHQfBI43lBE//5Qa9n8Gpzi+lLri9V6JNBgrBU1aqGNZHYaYi
         XxoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnGMkrj93GPKhhTeNXhsoSfiBYDZ2T7dGQHj+qS2NEur2RYwEanfLjlQI0gErWDSPrBes1PigYVgc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0CuMhZHa36ly7WXinamp8PUJEVQDhlur43u5/2zXjL0b17UmF
	9pBfO2zg2dRyE/WB41h/JS3acTHUm6vM2zqp5RJ7vAsOMz+DcIJKjqc7rJKTV8WNDYv0W1/jmR/
	B1R8lYg==
X-Gm-Gg: AfdE7ckC01aev2pXwf9myUY16UJdGkQ6/jSlAyQFfrRP3UOjeecs6NcqLOHiP48mR6u
	sNLq0vR6Lcjlc7FWd50fQtH/AFYTXvwf0ZMdS4X0WSHo8mpY6wA3rnkI1xwyIqeYjerq1kE3FtS
	P9IC7r2RhYx7eam7MAlllTPKTpaJoK31nCT25uNarfMLXbCFSYiRvx0UbxkKLfMekrdYmkspVXA
	ZkhwR421MyIr06D9ik++JVzXvsM3q26+NTmkWYxboAB2r3xg1UeyPgezuZi3v2LlD9obbnYIfXu
	gDiHiuk9s9mwJ36LjguCZyhWk2n7jTOJDDnAPekuLbDR8diUyJUblukxXu9Xdd8+YkF6ka+eOxK
	h8kmBv1FGY+y7UxsquqFlP8QkJUsEg51iVrJM3WC+UHwmHKuN5gG/Bt2iYSEGkScc4IGU7A66Nq
	vUbi3+0kfizoVjMVhH/LqD4ix68Ps3LhAbbgl+CoAifOnVooojdmzJlYPk
X-Received: by 2002:a05:622a:1f88:b0:51c:fdd:f040 with SMTP id d75a77b69052e-51cbf8df184mr97462181cf.21.1783959187478;
        Mon, 13 Jul 2026 09:13:07 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf5f61csm87555791cf.22.2026.07.13.09.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:13:06 -0700 (PDT)
Date: Mon, 13 Jul 2026 12:13:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: core: strengthen size check in
 usb_parse_interface()
Message-ID: <b2498cb4-61f7-429a-920a-e27ecd7986e4@rowland.harvard.edu>
References: <20260713-usb_core_patches_1-v1-0-7721c2b33f53@kroah.com>
 <20260713-usb_core_patches_1-v1-2-7721c2b33f53@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-usb_core_patches_1-v1-2-7721c2b33f53@kroah.com>

On Mon, Jul 13, 2026 at 05:43:52PM +0200, Griffin Kroah-Hartman wrote:
> Change the size check from size > 0 to size >= sizeof(struct
> usb_descriptor_header) in usb_parse_interface().  This prevents a
> malicious device from utilizing trailing bytes to incur an OOB read.

No, because usb_parse_configuration() has already performed this check.  
A malicious device can't avoid that earlier check, and so we don't need 
to do it again.

> This matches the size check in usb_parse_configuration() as well.

Right.  There's no point in doing the same size check twice.

Alan Stern

> 
> Assisted-by: gkh_clanker_t1000
> Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
> ---
>  drivers/usb/core/config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> index 17c93e95945f..91a51cedc1b8 100644
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -623,7 +623,7 @@ static int usb_parse_interface(struct device *ddev, int cfgno,
>  
>  	/* Parse all the endpoint descriptors */
>  	n = 0;
> -	while (size > 0) {
> +	while (size >= sizeof(struct usb_descriptor_header)) {
>  		if (((struct usb_descriptor_header *) buffer)->bDescriptorType
>  		     == USB_DT_INTERFACE)
>  			break;
> 
> -- 
> 2.55.0
> 
> 
