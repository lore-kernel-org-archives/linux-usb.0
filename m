Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37693161A4
	for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2026 18:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783018009; cv=none; b=IUUVo+kFDcm2et0rstfaHnFxKIONe+RUmgXZT0QJRvkM2Rhdjh8NnGO9did4kVTheyuJu43gtaKs42Qc3AQ47Fx225IrjRrwn+xEOPXyRdYYmxZ61/pb/L40iCt7goCMzupHAmC9JZqafu8KRONRwGTQVD19iqai+vFixgBwE1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783018009; c=relaxed/simple;
	bh=bc/Xk8McsmI3+DMbJka2c3Ec2Xspo5VMVo0hNXFZ3KU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrUaizwXwWrlno4CUlHyQgRv6NOIo3LMF0g4nTh8L2fHVBgU7TMOHTqC6/FHSg/awdPOCqrdk0/3cT8UuVtdXZV346Dbu+7ef8CJSjLM6wb0q1UyqLYzRkHeXTvHPkGT3tydAF0SOHo+A2qdFG13DKuxCvvTDzbjuJN2lbpysV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEPXf4K+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEPXf4K+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c19bad03so18059765e9.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2026 11:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783018006; x=1783622806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zTzu42wuhGDkakcEvAgGtUkHKmTIvih0X9WzMdoLMDM=;
        b=VEPXf4K+R884/Ik36BQWRpuFMSmhiKTzqnbLwcP2led2BODOYEbF/WrdIw5OHgBFXd
         5wrmy3hPHZm4vzAXrhz7KYGTRi7r+kEXiQ8GEE93Ha1rgpJyIK3nffTNaeQcECWw9LgC
         omCQuocjV33v2WlBFhhMOEdq/GgZwhvJlLRGsMkJ49inZ9q0uzhHAY96fbv5s8klWoPj
         tqNRBhBjUn+WrjEdh2H5rzJGzkLhSras+15pymd/+vry6xNvby3ekbyuRRfHcv/VM7T9
         I94zxQXkRUMBhPnUAApiCww9YFr4Z4oahAdN1bUR10IZp7aRAcY2mjh7GnZxP9ExhxyW
         Ro4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783018006; x=1783622806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTzu42wuhGDkakcEvAgGtUkHKmTIvih0X9WzMdoLMDM=;
        b=Z0uwbyjqHJUkor2zCGPMqK7p4/iq6KyEZX+mjUG8fzSCWJLSQgW6sDQnv47K5HgxrK
         +AGOaLDw80qfW+jJlN0YGQVmx1gwg/4+DQ24yS4lE3hJOLA+YchC1vUNhSWDf6P+WNVE
         xPi7YJ/+aWhiFu/sljg9TqgaffaAPRkQ/WuVZ7TxLBStpmAWq9E6z73TvBeYQL6jXpwG
         N69MmarM66SF/lvvUoYFhu25XTCWnzaYFe8c37by6vsRMnJaDJsg2Bhy0XIESSt5ma+3
         YaDpo+vOVvcXnt9zKzDbO3DOCgqnV4HReanVt01yMFeGrI1V/bQQw4o24BybV7+Gm2e9
         3VLg==
X-Gm-Message-State: AOJu0Yxz8MiqvYMwlWtSdMEXr15jmmTp7Vzq/tmBpQTctqphWaHrwkzX
	x49FAy9ih9TtyrKK1X9PwLtHjpcmNNjWS6pbzZl1ozS3EDVEfW49BynD
X-Gm-Gg: AfdE7ckyp3BlEu7NTowlHE4UKntRP/o/AMJYE+5OX51khVbjgiKXJwBa4weMB3gHViI
	ib/pNMN8eELSr6e/NKJnCOvB81Tcqr3HPybivhhCDNq0xz4iUQ+mdKCfBEj2+ArigRE2fZ6JKEj
	aYMx9qkCY5yTO2pq0pSAvhGQisFUdKnBTFKZbyzlyhex2Xsz0z8czcwXmA5Z89C7fxQtyiIKtgf
	vG70deYRKFw+d+KzgS4QOBUJBXE2CU48zHH0MnmPLNLZ91vqCmmx+AUBNyYqVE+4pqQsgOYe9Ui
	DGXnAO2Q7tJXSiUts3bkWdjVFoy+JgRgoyJ+e1o0hGuRni5/lK7U4dC4AmYaKC4XmBNqpcFyDeQ
	JOi5XxRLCK6voCI8bX+6fburr/0wrN/zJEMMvstpThmE/t5wIiPI+XEVN8xeSVX0Drdqk7mnWqZ
	on6ySYoQocxroh+woWuWO2UZpY6RxO3Qcv5sH2vIZ36CevidDa0CPTthzKqUj6y/XY9Nlj+tkwk
	jbBFvf7
X-Received: by 2002:a7b:c38b:0:b0:493:aa24:792b with SMTP id 5b1f17b1804b1-493c2b7f3b0mr68988115e9.22.1783018006246;
        Thu, 02 Jul 2026 11:46:46 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63172fesm120186275e9.0.2026.07.02.11.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 11:46:45 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <a6d660ae-44b5-4f42-a1b6-267d42f14c4b@gmail.com>
Date: Thu, 2 Jul 2026 19:46:44 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for
 TYPEC_DP_ALTMODE
To: Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xu Yang <xu.yang_2@oss.nxp.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
References: <20260702022036.44-1-kernel@airkyi.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260702022036.44-1-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Chaovi,

On 7/2/26 03:20, Chaoyi Chen wrote:
> most likely
> also needed

> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF

Perhaps 'imply' would be more appropriate here instead of 'select'?

- Julian Braha
