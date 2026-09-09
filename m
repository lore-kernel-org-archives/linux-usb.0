Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2242877DE
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 01:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788918564; cv=none; b=Pww9HbHKjjugCASvX3rrRo1rOTLAFuE06xDBP/ZHYBu4yqtuKWoBWYZMadH5YSd4gKDIe5DJTTRu+/n/pMAhNz+Zk88hkuL8eu2nhONYdByC4YNhftopJQ5gaf66zlF8Oo22YWIWP2MaGkYVVV0KI5ViWx+kYjn7OPTDV5T0qrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788918564; c=relaxed/simple;
	bh=YMmwzaxRrA837R5fF50BpVqDyg67m23LCvRt9BRx7XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnQ7tEhaezlP/TYtWPUDj+as8vAN3Set/i9KWVduYbyBQ9DHrVA46PnbnG4G4Xd1aw1Au6au5H4oMOkRyRIPUFOQbkLbtoARQHqF19K2Hjrqg5HWD0ksOsm+q6vryFMGdXWVzIMaezVcMS5Jx1pX8fUR/ej9Dw8Xmd0/3d9ZPF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZKVpW2mL; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZKVpW2mL"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfbd148cso5960216d6.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 18:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788918562; x=1789523362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P3EsztsSAZiHFdWKJp9lms32NG0DgzcMlpDdtevPa+4=;
        b=ZKVpW2mLZsEJcYO7BjwMPlvKA389wakUC4wE2D81hozdmwBwfzyFv+nZvfVpXmgaOG
         t3gcecWN1J+PkchEIvYeLasy/+2M4KdWlvqhfrlGMAt/ukjiKkX6OxIma1C0IC4X05YR
         gUN6HMmJlV2rnvaGYJYWzPRaRSe6ZVEA9auH5wiTe+K9yjhLMHlrqbB0LiTlrAzyLME+
         nbOmHvSv0s5U+m0RMTApf17HuZKygAdtmsYhvw6ty70u3XcOzRdFSqez5NznBv81XQ8/
         dIZdB9WVrqlhy2suHF6m82mYh3AhJ5NAp/P+pq/MmG5Ls4xfTlyJj/rm2YjIOo6gd9Wh
         DTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788918562; x=1789523362;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3EsztsSAZiHFdWKJp9lms32NG0DgzcMlpDdtevPa+4=;
        b=Y9LQw9K2ve0/Iv8oCKYsqQXura+tWjlrajZ+aw/JV4q7H/IOkbXBxBQ70KPLtVVNjO
         vlUOd7oJU32KZRdO5a3Ew0HKBnl5CTPW03jLk2PQRb1gy6JUw6HtMwy79cnk7OKpo0b0
         PWgkRYxKIeBbJaPlUSItAPgP6B/pOJtdi5jajSZ0jGjX0i10ty6No8xigAD6H4L0ZZg3
         a+bnq0FcLFDf6dDWa5DGJhjpwK7S61qhRqbuIHnwfIvlbjqHqGuYyQHvmLPyS/e1hk6b
         lk57TccvEKpGuJXbXt6VKPt8wZv7QGTDHlj0qOXyknp3SKH019sVRk9pjDbkgtMScFJI
         dJOw==
X-Forwarded-Encrypted: i=1; AKwUvBxJjcJwv7yryu/IPSoYnmf1ZivwT/+R/sy/qF1+IgzR4SN1UDzQQGjP2i4qCEz2bBPY/l6sMeduwcs=@vger.kernel.org
X-Gm-Message-State: AFuF++kbpVC9P0HrUu/ciD3MCFXQcMVQV2uh14i3BGZHuir2qhHP8tMz
	6QGIfzpt4OLrez795md+T4FRO8+kEASr/PX9gNMQ5FOSCIPpOTrR0vq00yqBrg3lBQ==
X-Gm-Gg: AYBFou1+5+vs3c027JgDaNQbHRJAeajfHL8rhbE4b3rrK+rESDRDEHZ0DT24T2HxnBN
	wp1Ok01Y86jzNJYQVOKanKejcGD0x+Qg4FTdmBWG5K1vBBTXw2iJcg1nwX4FB1nGYCnYm7y6Z8i
	GpK+sA2N5slxvgSAimu6EzbpdYaSy2cCPMndcsk8OXrVWNM9wp7b3dL8LCHyPaNM3OOdmEx6AQU
	ucuqrtYXKIbCRrA64nkqmLA3viFOdf412HtDdFJjdynv1js7SaE/3OfIiWnc6DRgYNiEx9GzJac
	tzgEW0fcPqARKUF8ypWOr0DdgyoW4xA5G7puT5fZ8dMvMDs0MZhhsenKPKyomGLm/oFw0gNxN3B
	G5PAswhhlVsBLHHZwAIFn+AL37NinJWivnBlDuhkzjfcaKUYXnTbrJEjy1JG2ThXTTMUdBpFkwo
	PfgyulGBNAgfUtTYo21+Bvip3ohYLL+Fng7aYvgA7RaV/QCzXSwQZ+KBsIBl+w3PtmG1jChBD1
X-Received: by 2002:a05:6214:d07:b0:910:2ffa:efe6 with SMTP id 6a1803df08f44-9106b424fd8mr49490386d6.30.1788918561974;
        Tue, 08 Sep 2026 18:49:21 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406475f5sm129440796d6.9.2026.09.08.18.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 18:49:21 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:49:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Keisuke Tsukuda <catnyaaan@outlook.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com" <syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>,
	"syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com" <syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com>
Subject: Re: [PATCH v2 2/2] usb: gadget: f_mass_storage: ignore class
 requests while inactive
Message-ID: <9aa4086a-dfdf-4226-aabe-c05a42cf2a83@rowland.harvard.edu>
References: <20260908203348.95825-1-tkdkei@outlook.jp>
 <20260908203348.95825-3-tkdkei@outlook.jp>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908203348.95825-3-tkdkei@outlook.jp>

On Tue, Sep 08, 2026 at 08:33:54PM +0000, Keisuke Tsukuda wrote:
> SET_CONFIGURATION is handled asynchronously by the mass-storage thread.
> A class request can arrive after the composite core selects the function
> but before the thread installs common->fsg, or while the function is being
> disabled.
> 
> fsg_setup() already rejects this state with -EOPNOTSUPP, but checking it
> through fsg_is_set() also emits a warning. Check the active function
> directly so normal requests during a configuration transition are rejected
> without hiding fsg_is_set() warnings from other internal paths.
> 
> Fixes: 8876f5e7d3b2 ("USB: gadget: f_mass_storage: added eject callback")
> Reported-by: syzbot+d31109047baed8f3b590@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=d31109047baed8f3b590
> Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/function/f_mass_storage.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index a50743c..e80ff0b 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -463,7 +463,12 @@ static int fsg_setup(struct usb_function *f,
>  	u16			w_value = le16_to_cpu(ctrl->wValue);
>  	u16			w_length = le16_to_cpu(ctrl->wLength);
>  
> -	if (!fsg_is_set(fsg->common))
> +	/*
> +	 * fsg_is_set() warns when common->fsg is NULL, but that can happen
> +	 * normally while a configuration change installs or removes the active
> +	 * function.
> +	 */
> +	if (!fsg->common->fsg)
>  		return -EOPNOTSUPP;
>  
>  	++fsg->common->ep0_req_tag;	/* Record arrival of a new request */
> -- 
> 2.50.1 (Apple Git-155)
> 
