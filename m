Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270668;
	b=IeB8AkQHBk4H2ruoJIBZhjU6yCSG3xjVKUfHWvPvDjoT6+MgGZvwKY9TRxdXCIR7jlZq
	 liDdm5KH1GT8X9+M1ff0HuE+kHN8yytHTGgT1+Gk2zAnu77SpNvYp49yead4XQK9jlyn+
	 yfmOhChe8QsiQh3O5ilZ788LFJBo0zaQKr5XoGxv6SnZIa5Htd7Qy9ItNFya5TtlTELME
	 gLqMdUzpSO2UyyKbdgZeMqM7gLHUAf5UjAEVm3mc54vc2HiaSWiFInqfIBjz/lWBCzz7G
	 ZgfiwUzBTJtpfK47vh39OTmwO4ikl9EPKcVNRqF512lZTtJZyV3hfNmQrIDXUWxhZtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=uMxg2j2ArABS94uWcydZWkjTN2mWanzLIsJic7WNb3Y=;
	b=FjuVfif1dxji3gLr+yJlL0dcfZVMCs4WPe2QE5lU+nCPq8IWpNzgz4hTcN61RQpAJHMg
	 nNduqOJPew86zaLBlCD8EuMxMz/aEfopJTXOx+n5Oj1yIFgvt1WmTzPSZElt123rz5snx
	 TX2Vat6Gxb4P1jt7snFRqenSGuZiwUMRRGJFRclPErMP4xi1QCOOWxcLVh3ytXOvF5JwT
	 GNMcdP6HF/Ct+m+BZ8JRAhHku5RP/eS482fBQpsLmpzQ4tWK8QUjxL5n6eFzWsLZ5eAeo
	 ddv4OCsNDo1tWALyHleF76i/k0xdnhsC3TUanmZgX2CHDNW/A9AO7IiR5j8PtbFQXJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=04ifj2We;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6602E606A31A
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 10:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6602E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=04ifj2We
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1557591f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 03:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793270667; x=1793875467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uMxg2j2ArABS94uWcydZWkjTN2mWanzLIsJic7WNb3Y=;
        b=04ifj2WeyAAOGlbfGZESAOhUycbW9j4QbHFFNujZ5tSmSmuJOXM5dHuCNLyc7ojP/u
         FmjatzrJrM8c5B61zA2LgYjDPi7B5bDxKPvP4GiHp/4YF4xxpuUsSDj5nrepjRcDNwd5
         uHkFjqZE/NBRWhjykCjpSEnFW4VCYJuYkak2Y8XZz4WPiXUUDCVt+0Z9rMxplabU6oDW
         258K89rMmvrwjCfyY6RExMHK9T1w4EXjvuqaC7Ft1DxmPAhME9NPQO/waRki9IQecuZl
         2J00O99Vit+RAvb1By+wEPo0VN9k5/bWb14gwkDglMMpok7ZorOl8whIHFF3FhOP7Kkp
         kt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270667; x=1793875467;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMxg2j2ArABS94uWcydZWkjTN2mWanzLIsJic7WNb3Y=;
        b=t7sE+kgzEZI/25ZD03ykHqmGKestYj7X08XNmAxAFEvifbocYZic3+QbxcYiJ01t2N
         d8kTFTC77T1h+PsBGcvvVNayrjGG7RTola7WFpRBn2AL0GF2pT+beGJY4z0EFa5eEoEG
         NX2HggBOMi0pF6flZ6azriUKagrF0wIj3QV14h5kzAnO1hYAR/8AQp+dS1JoOBVIvFDg
         5QHAq5kHU/jxi5qt8lO2eh0qC4Kc7o3ea54+rDhdpgWfLSSAgDnUn9dt2Nnfbis2SmfW
         EmAlVN89xHItsZCuZRnNgfh/+ebh2vdKe9UH4wmmh1+kRSTsuBTLz3UwbUUgasE4qtdY
         vxbA==
X-Forwarded-Encrypted: i=1; AKwUvByGK5mJrELC5nTp+uD5hoQNJ1nsjfOUQzkg4GI2IXaOMRzxkmyqpMxyQFc++2uMQEZ0KfzuaP9sZiY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpGuiRZidA34pLFzIphz+L2viHA3rpmIJEZkZmp5+bzDjUeSiO
	ntQDqt5KxjJxUdZFw7TubyKH3Qe7uoZcxDnvYtPozmjMTtjC/gMLpb20
X-Gm-Gg: AYBFou1HWGaXAoE9Ct2zGeWCUvpQ+MFbc5hz/A0JpyBgXt+KQwOnEcQmVVmeiIy/ywl
	kMCNHvVcxiMJfXNSyesCMoJ6Y0sng01OdpSe0l9ik6sXjbX4z+l/1AAQiImTZpEAyVUaelQQUqT
	Iysye4jceSLtrBq7A5+Vgtroda0DwUsoSrbsMWDT9PplIiBA/KX5x16dHv2Y9bTkOVXbbkSl4fe
	75T66O4uFdbi3yrNrIc1bciKXHebftlOxfrzbVD+aG6I+J874+8fhDl8kT5sKBJwXXHxT9pTGzX
	yBzNK1eQJskGKrbKVHN9TScN1TipLYNI+5UryzwzB9ZJ4IxK9oaTDqFqJUAEdoLBFI1l2Usva6L
	w2qRl+c9R85GZpVP7MQppW4NqR+QQekeilYQowLlg8WjsdMi1UndtnljFbOSwOVYuQJG3BJWDVz
	1tKKjlqPVr9ofiQgX+fHJewPuEJ2wwjSE7axBYOB1YYNVGD7mfM1eUENhTn50i3z5jFGefaPwRQ
	goXlFnQ4fZPmlzEsOixZpcGDspEQsPHJb7CtqhmnfdxzjHlo/xPbc/ilccGV6TstWkgVhhYxJA+
	7kIWVYwoWeltEXDN5tZ/bdHFpsORI3d+MBlkRw==
X-Received: by 2002:a05:6000:1a8c:b0:48d:eec6:308b with SMTP id ffacd0b85a97d-48e5d2ecf6fmr11893654f8f.21.1793270666746;
        Thu, 29 Oct 2026 03:44:26 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm32900670f8f.59.2026.10.29.03.44.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 29 Oct 2026 03:44:26 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:44:22 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: IgorpetinDev <igorpetindev@gmail.com>, Alan Stern
 <stern@rowland.harvard.edu>, Tejun Heo <tj@kernel.org>, Oliver Neukum
 <oneukum@suse.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: core: hcd: flush giveback work on stop
Message-ID: <20261029114422.2ba64d53.michal.pecio@gmail.com>
In-Reply-To: <2026102924-flashily-myspace-60a8@gregkh>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
	<20261024155614.2732-1-igorpetindev@gmail.com>
	<20261025000643.425c57ca.michal.pecio@gmail.com>
	<CAG21Q83f_Oj5+-OPjFdxzmLWnFkjfYhY9ordyO0zoGtxkWEW3w@mail.gmail.com>
	<2026102924-flashily-myspace-60a8@gregkh>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 10:42:35 +0100, Greg Kroah-Hartman wrote:
> On Sun, Oct 25, 2026 at 10:54:57AM +0300, IgorpetinDev wrote:
> > Hi Michal,
> >   
> > > No such domain?
> > > Looks like you trusted an LLM ;)  
> > 
> > good catch, that was just a clumsy typo on my part: I accidentally typed
> > appspotmail.com instead of appspot.com in the closes tag, anyway - the syzbot ID
> > itself is valid. If Greg or Alan prefer a v4 to fix the URL typo, I'll
> > gladly resend it, or it can be fixed up when applying.  
> 
> Please fix up and send a new version.
> 
> thanks,
> 
> greg k-h

Hi Greg,

This race had been reported by syzbot previously and a patch
has been hanging on linux-usb since August.

https://lore.kernel.org/linux-usb/20260823125831.6ea35650.michal.pecio@gmail.com/

There is only a bit of controversy over flushing vs cancelling the
work. I think that cancelling (and leaking stray completions as opposed
to letting them run, likely UAF things and maybe corrupt memory) is the
right choice, as a courtesy to anyone who might create such bugs and
need to deal with them.

Regards,
Michal
