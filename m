Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="B7cunsCX"
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8798FD3
	for <linux-usb@vger.kernel.org>; Wed,  6 Dec 2023 04:21:10 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so629573f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 06 Dec 2023 04:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701865269; x=1702470069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/bbByIcySMhUdfS4IPDL9IRngLZ1+P2iwsXVOTpcIWI=;
        b=B7cunsCXeO3WXeVGCBEvpV+OBgW/xJ/MNLh38HXKnIdj2xapWzbBJiEjJQf+t+QNle
         R87lXOrcsVawTi0XQmz9N+BnzTJwZ/+CC16Gf3qhUMUIVrU83nMIkRndkRZ8RBy9YAGe
         q27N99RLoS8FT0Uc35ccIfgGY7v9nhmZlyPt6bJ71zQ2TwMXS2GUhHoDyAOK4fmAB83w
         gy5QMe2b+Dxhw+J3GjUj3c5mn69TC+ftTaNvbNZ6mO389vD3doLUeKDcnrCpTLOPF0b0
         fpQinZn3GOi8irTbn2DhgQQJgec09RbsuzOqf4Ia8SX9707bXiXiXsvYXC/kO4wRfYeG
         WJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701865269; x=1702470069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/bbByIcySMhUdfS4IPDL9IRngLZ1+P2iwsXVOTpcIWI=;
        b=qWYTi87561ku553IuTlET+6cu1f7pdYpIfBNwJNB270261Qccxt0KbE5GXbEEyQ1mg
         9rrblS0fVloac03V+1XvsQdsTyc1jj6wWjAswTWSyDxqH/6h37Wtp8RlV/KZ5ymFBrCb
         nB+D1gmx8ldcSfQIi8Tm+A6yp6u+3vT6nEh6XO3zRkH5+ldPdw1/EbLt89FSy6WPO+GN
         X3F0fvU9OorsViykSLfkePRNExWv+yE8WsLtzZfoy+CgHFgHMmJ31LMHuIpR/UXlT5M4
         thIYP6OXP46hMRW7LUkCCLxT+6r6kY0QzO6pfcA4lH/VHP7f3lR66nSPkh5R9987CJmN
         SrSw==
X-Gm-Message-State: AOJu0YzNq3sJJB/jrSlC/kVcXePbTep46YJC2sQmrx7dHYESUws7dDe1
	hIoFUXIORx4A9di4T2E/P8lgUg==
X-Google-Smtp-Source: AGHT+IGd0yd87kkaGLMyoGWCjrN0utT63HbZ8YCgxK/PZlAXsMTbPDp8+E/Qp2uvw5ZtKDOEqcCSWQ==
X-Received: by 2002:a5d:58db:0:b0:333:273f:1cd with SMTP id o27-20020a5d58db000000b00333273f01cdmr428067wrf.36.1701865269000;
        Wed, 06 Dec 2023 04:21:09 -0800 (PST)
Received: from ?IPV6:2001:a61:13af:fb01:86:2ba4:6c05:7fe8? ([2001:a61:13af:fb01:86:2ba4:6c05:7fe8])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d420a000000b003333541a5bdsm12691327wrq.80.2023.12.06.04.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 04:21:08 -0800 (PST)
Message-ID: <2ce653b3-c553-457f-bcbf-9fce36f82dff@suse.com>
Date: Wed, 6 Dec 2023 13:21:07 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding CDC NCM and VNC performance issue
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: davem@davemloft.net, edumazet@google.com, hiago.franco@toradex.com,
 kuba@kernel.org, linux-usb@vger.kernel.org, pabeni@redhat.com
References: <a13fc273-20ee-4027-9508-7e8e93a9cd29@suse.com>
 <20231205201453.71764-1-hiagofranco@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20231205201453.71764-1-hiagofranco@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05.12.23 21:14, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> Hi Oliver,
> 
> Following up on your initial email, I found that adjusting the NTB size
> successfully resolved the problem on both Linux and Windows. The VNC
> client is now operating with speed and stability after dividing the
> package size by 8.

OK, that indicates that your performance is bad because your VNC client
was only partially filling the buffers, which caused most of your packets
to be transmitted only upon a timeout.

At least this is my working hypothesis.

> I know that altering the NTB size is not the correct solution, please
> consider the attached patch as an explanation, but the assumption that the
> issue may be related to an accumulation of small packages, causing delays
> in fulfilling the 16KB requirement, seems related.

Before we proceed, however, your patch raises a fundamental question:
Are we talking about gadget or host mode here?
Could you please describe your setup in detail?

	Regards
		Oliver


