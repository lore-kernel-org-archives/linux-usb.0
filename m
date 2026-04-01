Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEFF345CC2
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 18:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068124; cv=none; b=DhuZQZsJmyTDCGTJx4gk6ng6zELw1E8jm/bEsWsGJBNkfinvmCM8asCw8qTfl63edBnCIzQYswoaTkA2BnHIv6SuyqhP9cXTQn38M9DTNrRnLyDci4tnoAeJlBD67Dd1YnPWSuOet3H2gcdk/aSeaUcJzpaE5zKYppSoERsx3xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068124; c=relaxed/simple;
	bh=UKTZoesvlkUmpVjBnnnmkZu42wFtE56ai+CTDbeVo0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSQpy8fUqso6vxeeT1xpnnILSivv6VhOUcPhmBxWiYe1zWIbbF0YeRsGFnexl5gqMi7wBG8RV8FKBBtYaWT6ibInjSuuj/coByNXlcWxREXUjAxTJ11RLor8TM89qfOuHRaCDXwUiFZgtz8yMRyJr6lbqUKYIOHgNI7TnxwdnZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yrp1Do7J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yrp1Do7J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363D5C4CEF7;
	Wed,  1 Apr 2026 18:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775068124;
	bh=UKTZoesvlkUmpVjBnnnmkZu42wFtE56ai+CTDbeVo0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yrp1Do7Jtlm3JaYt4MYQLVbug9Xf0TkF9KTGkfIKBwnpFEfuMVgNYzKoKzWcbau37
	 fNb3UZyIvitSa6WG7Qjr2cD4+X1I8cwdhybS3UyOAsLxsykKrOnEgbUtrXFZswnl9o
	 dVq/CpIgRCFG2VVi2RXab7sIZbuaaQ7AbWrLtVGo=
Date: Wed, 1 Apr 2026 20:28:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Taegu Ha <hataegu0826@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_uac1_legacy: validate control request
 size
Message-ID: <2026040144-gratitude-haven-f28a@gregkh>
References: <2026040124-unheated-opponent-3c56@gregkh>
 <20260401151539.3441000-1-hataegu0826@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401151539.3441000-1-hataegu0826@gmail.com>

On Thu, Apr 02, 2026 at 12:15:39AM +0900, Taegu Ha wrote:
> f_audio_complete() copies req->length bytes into a 4-byte stack
> variable:
> 
>   u32 data = 0;
>   memcpy(&data, req->buf, req->length);
> 
> req->length is derived from the host-controlled USB request path,
> which can lead to a stack out-of-bounds write.
> 
> Validate req->actual against the expected payload size for the
> supported control selectors and decode only the expected amount
> of data.
> 
> This avoids copying a host-influenced length into a fixed-size
> stack object.
> 
> Signed-off-by: Taegu Ha <hataegu0826@gmail.com>
> 
> Changes in v2:
> - rewrite the validation logic into a switch on control type
> - use constant-size memcpy() for fixed-size payloads
> - convert the volume payload with le16_to_cpu()
> 
> Build-tested: not tested, build environment not prepared

As you found and tested your previous change, can you please test this
one to verify it solves the issue?



> 
> ---
>  drivers/usb/gadget/function/f_uac1_legacy.c | 47 ++++++++++++++++-----
>  1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
> index a0c953a99727..00cc7161db66 100644
> --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> @@ -360,19 +360,46 @@ static int f_audio_out_ep_complete(struct usb_ep *ep, struct usb_request *req)
>  static void f_audio_complete(struct usb_ep *ep, struct usb_request *req)
>  {
>  	struct f_audio *audio = req->context;
> -	int status = req->status;
> -	u32 data = 0;
>  	struct usb_ep *out_ep = audio->out_ep;
>  
> -	switch (status) {
> -
> -	case 0:				/* normal completion? */
> -		if (ep == out_ep)
> +	switch (req->status) {
> +	case 0:
> +		if (ep == out_ep) {
>  			f_audio_out_ep_complete(ep, req);
> -		else if (audio->set_con) {
> -			memcpy(&data, req->buf, req->length);
> -			audio->set_con->set(audio->set_con, audio->set_cmd,
> -					le16_to_cpu(data));
> +		} else if (audio->set_con) {
> +			struct usb_audio_control *con = audio->set_con;
> +			u8 type = con->type;
> +			u32 data = 0;

No need to set this to 0 ahead of time, right?

thanks,

greg k-h
