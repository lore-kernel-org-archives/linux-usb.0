Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429396;
	b=iKXRbmY05jMQxAn/mxG4HEhTF7rT1CucSJMeMWu9i29yZisjjJjvM1Q8Oh/sqM8VIfD7
	 S1N/ZSToeQmHtjujzwK+EqkdR3noisxYw9v5ih6Xe8ZDiLwMZDuXNyo8vwx6qsuwvW4MS
	 UdvUPIRpfk1+UebcKO+D5TYBW8DmfNdCKRR5rQG1xCfixUOdtpyR0bmlq3eQmyspToXWd
	 84nErgQ+4XExGyL8YONeFWbdhvXvCAi3KGZfqv31qR2xR4mUaQsiZ+MUCTVSUnPKO7qwD
	 sa3vd4EjnfF6atCIIL+ADBJRFExAhAon7DdGfOWURBj/zQudpFp8a/nYvd/uXhBLXeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1MG7opruDk6HGbhLyOi9TXyXBCsTd7Khpfpd5KuFRfw=;
	b=ppUn4L4MFLz2VlluNKIFTA6ogSVSwYltKlYv4RCNz+5J0rYT23AAZXedcVHrw4KoCVak
	 mvsvPhOZgTxMPXp5VrAnQAaXMC0Q6Ksx2CtFC+3SMkbIhHzcdIUXd6vhOYqS836JDnuZv
	 DTUPo4L+20PjO7GDjwZhtFBsqg9Yo8a/pZrtGlNsYocdWCrCwfJpvqMx3s0NRM7xOZs3d
	 Je+K5X7vPyUfQaOGdAXX9+3kDzFaXqS9mLJd+SQfYk4U8zA5VydSWwrBWk/BKHb+mBqRU
	 Gj2o/dh0avaLokQ0xCAcI7GMbvLnXVXCcbUDuAquWQ4NkqpJavOkUDBbIl1KAzC5GDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cmEDHLqa;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D399C606A33B
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 10:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D399C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cmEDHLqa
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b467581b98so28423135e9.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 02:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795429394; x=1796034194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MG7opruDk6HGbhLyOi9TXyXBCsTd7Khpfpd5KuFRfw=;
        b=cmEDHLqaWYolsqsyPJ6jVl2HyBwR4eOy3PT+08higAX1YYgkcwC062OFRyuyIWXqkX
         t8lH6BuXt3w2QUgepijLAGLr4VkNVcdRKcFL1A0ioX6jMt16yzOcpke/ySd6nWemt2B2
         vO1e7FP9Y3XTcwhFuZaYbvJWBAqMaC3u7qPQYHaV0jRIVXlRLkP340VQm9zPrzQyoLA/
         NTq44exarTHa5EuwRjqhGckyQ1eYGd6V2q8AwlwGmvcUXsibUhH/mCLQS5vLox0CZk8X
         Eqn1SWUa3s8TDegfC2T1SUZ+8sHyMDWXqzgT6Uf6Gh8p5BA4dHMLQ9NjLfDyvardwwkY
         iuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429394; x=1796034194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MG7opruDk6HGbhLyOi9TXyXBCsTd7Khpfpd5KuFRfw=;
        b=D2NOL/KkSFMhqEGPeFVTqhOhbvPLSTo/pzeRtZ+a96DWFAU1/AID8ONswrRgmkJAdm
         25rBo/+0w2+ipKuJ7sM04MmI1DV+I1G0udQ4jkniVnxByAvQq2F12hx8QSwZrrrboCP8
         fmF3IFX9eAbCRzQccyCIgrtVkGQ7gXNXvCPHciohi4W9N5AkzuvhwRXEkOBH8z8P4ETT
         xiucObi8S4zR2ma1AOivcysmzea76mG15Rg/L3851VJgS4rfpuVwKRiXp+TE3usUDw14
         Y4jqfY09n51WQC4lr9n1/ufUM5n9xA6seHb1ntUPTm4NTQjxk12ZSRbnj95I0biW7Et4
         i2qQ==
X-Gm-Message-State: APuU4Z/KUzXw/xseIBNBTbwTE4dG5roUZh8o60OvgLdkcc5sHHQ3HAuQ
	xcyb0XBlQ+PfdkF15opGkkQGFt+jHrM3lCgzBmsISUjc3HmQMDhTXB84uSN6kvrs54U=
X-Gm-Gg: AZFdTZetTucaHQQYqET5tD99mJ803yBWGETzbW5sa1+ZMvtm/CDTPP3/MPxGXZTKRUD
	jm1N5rC4FfWDywNjJf2FPid+7yioKVP9hvN286YmojeckjWGptSZ9ponn9a4ey6CGT9otLhkOZv
	tYIVTXDOOkGOlGx0GLT6bkfV49wi0bD6O/i8zVn39C2/Y3o9Tt7H/Q21qzAL9agY66anLmejeqt
	WSyQzt7q+Fohb11d51wNvbER9EbrqV5FyYHSIChthRYSeFGlotf2knGodfKkG1zamcZWXdtI5s1
	4tWIimwV4RD799gWnacGsBdwBDan21Y0C1bidJOD7RJQuVtFaWR+7SOHSr+wn0pfqWv8upz4+Yh
	LzMn8azudIbOss/nMcrZW5q4R3jDtgfG2s1/9/0pwjDeskktTYIDw252vKpevuD6t3EzW5AJsmj
	MfKBccNxlKcah/QFvZzK2Se7s0rVsKUKtn8APA7f9joUbJFK6exqkmYB2w2aUwNu1cl3VBkP6kC
	BlzRwT0YdGh3l2aZD2i3l54HhjqKZvUQsnaBKOaI7zCoKz6ZkdxqsPUmx3z2peVjrIetuyyNyxO
	tBH8o0bZ11Od97pp50Z7EOhVzAZvHpzOQtj6bssyRX97+6T+/jcF6F9mfXlHX+/spp6l4I5xzEy
	H1Ln4yLzCPCiUe+m4
X-Received: by 2002:a05:600c:674b:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb8892c0fcmr212081605e9.20.1795429394227;
        Mon, 23 Nov 2026 02:23:14 -0800 (PST)
Received: from ?IPV6:2001:a61:131e:b901:6da9:459e:7c6c:e85e? ([2001:a61:131e:b901:6da9:459e:7c6c:e85e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b205443sm22138236f8f.39.2026.11.23.02.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:23:14 -0800 (PST)
Message-ID: <51674f53-673c-4115-af66-c0fae252fcd3@suse.com>
Date: Mon, 23 Nov 2026 11:23:12 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] USB: cdc-acm: restore the line coding after a
 reset-resume
To: Piotr Kubik <piotr@kubik.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Francesco Lavra <francescolavra@interfree.it>, stable@vger.kernel.org
References: <20261120171809.1494779-1-piotr@kubik.pl>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261120171809.1494779-1-piotr@kubik.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.11.26 18:18, Piotr Kubik wrote:

>   /* devices aren't required to support these requests.
> @@ -1739,10 +1749,27 @@ static int acm_resume(struct usb_interface *intf)
>   static int acm_reset_resume(struct usb_interface *intf)
>   {
>   	struct acm *acm = usb_get_intfdata(intf);
> +	bool last;
>   
>   	if (tty_port_initialized(&acm->port))
>   		tty_port_tty_hangup(&acm->port, false);
>   
> +	spin_lock_irq(&acm->write_lock);
> +	last = acm->susp_count == 1;
> +	spin_unlock_irq(&acm->write_lock);
> +
> +	/*
> +	 * The device can lose its line coding, for example when it loses
> +	 * power during system suspend, and acm_tty_set_termios() sends the
> +	 * line coding only when it differs from acm->line. Send it from the
> +	 * last interface to resume, before acm_resume() restarts the URBs.
> +	 * In a runtime resume of the device, an autopm reference here would
> +	 * wait for this resume and never return.
> +	 */
> +	if (last)
> +		__acm_ctrl_msg(acm, USB_CDC_REQ_SET_LINE_CODING, 0,
> +			       &acm->line, sizeof(acm->line));

Thank you, I was a bit premature unfortunately. Could you use
the acm_set_line() macro, so that the driver stays consistent
in that regard?

	Regards
		Oliver

