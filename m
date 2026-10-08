Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180E13368B0
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 14:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468969; cv=none; b=Z5Qw6XMZSWGIEAlA92y8KKkotbmvtwWR7LIcS20S3eAsv7lk5hnCDkM8p7cfvzB6i7WFD2wx67FnvwRtyeAVvTY/YGZF+M7wJhUlCK4qZ2Zo9/RoMFFqFraImFzdK4Tunqrr9tQhlIKLM38DDhDOADLvHxHJIeamMG0aBx6+/GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468969; c=relaxed/simple;
	bh=+t31azwcCJHg+PTdel+R4blWILgZCTTuWf8AH++/aVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tluxUKshuEh8HWB24JgKb4jiI8YYLRqkkvQCLBty77x9ctlsbpVqeh7gVkYC2TPE/dEwUmk/yIEiBhE1XFvhh3bn/5FF8JdVzReq8ai2FGUzXtnRsJWToaprLvbKL/+l5B1X2xlIFb7EtRVIV4xJKv4uODO7m3KN+UYspnlVBXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=myGPmTC3; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="myGPmTC3"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9144e8021d3so80793076d6.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791468966; x=1792073766; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3W505++mGs3YgmeV426L8BBID4lmqouAVUZbbYJa+Y=;
        b=myGPmTC3ygLdQ3LrYWuEy208LjDEklIFdgGEbtLQQOJ6H2QIpeLei+Q2hat92s9+QI
         Iuh/0vTpd/T82LgeNjiYuuSLaNuccrkoQ4lh5NiwiYF2LFfsvaAY9Y0Owp8etbCyMJCN
         CZBPONjJIfHoIwSu+bpsmdysBPD5Xd90c9XE6feu5nFAtzK5BIkldLdwsIi7dRrKvgbX
         uI6fYL6Qmo7Dyfxq+JylRnKKTS9yxvtPJQ0LLlX1Gln63cZfMW0A7H34CtWKihKM/kdp
         itVfAlG7FMn2G/p+0D/lV/9GzML3pgvz7PJEhi4hpZ6vZNLLjwpO1juCw1oMwmalCQ/8
         0dJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468966; x=1792073766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D3W505++mGs3YgmeV426L8BBID4lmqouAVUZbbYJa+Y=;
        b=b7NfX1gxU4KxxYRIsk6cwIv2Tvv35zO88lxiHnONcBp7q6krYQKPS/BvN1G+Mx2Ln3
         yfRylejt71nr3+/TMaNDma7LO7I5gBkdqTZO1GWEA5KykoKkEKMdHmI3SmVNP3fErI3w
         N77frwObyokM1OAwnA/DlJjdPsSNrdWxgz6A0TMFLmthE6nk6zirWEWRzhRP/I34SE3M
         DWHCvUhu/NtKyMMD5aDD0XLl6th+KUwBozp0OyDzq4aU9ZbPNbH9bsNlN7Qr8OuT0ArR
         O0UD62IROLIkVPwHSsHAVddF8fpGMD3Aa1PdV4jGtyA5jC5OARXHOhOrgYRf+pZGHvGA
         rLKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxaJvN17U2AGzNNjtg3WTdOZkFWhRAtwzYLRgeYW3KqEQHd1qUz9KNMMWicnB+gWMhfoVaWEZ3BAU=@vger.kernel.org
X-Gm-Message-State: AFuF++lihSD9zRVneHeszX/udXv+eKLmCGS5/1Y6IgyeS1RiCC9R2iHZ
	k9Wr4IkPi0ovP3pDqEvGT6zOR+GhksbNNmWcMeEJrb0XRL39LKJRsjU/MBntkX1cpg==
X-Gm-Gg: AYBFou08Cj21C8mtox5D2BbcCFRmFmiDgI+RD8fSGJpwnwfmO9vVyQt/nYnhpBPM0W6
	VUlz3eJmY10lU4j5aFai58KR9vQRvN9qHQxvWIcovoPh+xXEpltVj/4lK0rwJkK2dP1WG+iXgKt
	LQ63Qe3HmDmDrB6MRsOC6afZIju0N1W6kKhOto6f/z4hh3HNxvHu/7zdXSKvDvZ39tl6zl1sU3+
	cLYsF5B2xnADNA6fqd+zsv0rZ9GoN32eQlzgJ0Gl2IqjqttAzpgF8SJPsnPO3tINGOXStFXCJXk
	Fcpt0V1TkevpahRjfeoOc918IUdMBgRsnwKXmBC0NW/9eUukQ3rhfHteJ8nd4UZXffU7fb4/C2V
	2z9iV/oniaMGcDY+WfHdr7Y1u0JikHdTYav0Y0OG6Bp89xfG7TRdjmJ+k3G71tWghmztTLwvfPk
	loqz7iddZ5DswHrW8RNyvrI/MNW5E1QBw3OzCI1QniF1Bc+DU7I2Kmg4z6akJ/RQklWwhgOqnFR
	nlUgfnHPcpBG2wd
X-Received: by 2002:a05:6214:2408:b0:919:952e:95f7 with SMTP id 6a1803df08f44-919978b8a53mr106709096d6.51.1791468965565;
        Thu, 08 Oct 2026 07:16:05 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91996cb5517sm48391886d6.15.2026.10.08.07.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:16:04 -0700 (PDT)
Date: Thu, 8 Oct 2026 10:16:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?iso-8859-1?Q?=D6mer?= Mete Kaya <omermetekaya0@gmail.com>,
	oneukum@suse.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Subject: Re: [PATCH net v6] usbnet: fix smp_processor_id() use in preemptible
 context
Message-ID: <7c4a2f1c-f16d-479b-a11f-cef962d5e2c7@rowland.harvard.edu>
References: <20261004215937.302247-1-omermetekaya0@gmail.com>
 <20261007200049.079aeb75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007200049.079aeb75@kernel.org>

On Wed, Oct 07, 2026 at 08:00:49PM -0700, Jakub Kicinski wrote:
> On Mon,  5 Oct 2026 00:59:25 +0300 Ömer Mete Kaya wrote:
> > tx_complete() calls this_cpu_ptr() before disabling preemption, which
> > triggers a BUG when running with CONFIG_DEBUG_PREEMPT:
> > 
> >   BUG: using smp_processor_id() in preemptible code in tx_complete
> > 
> > Fix by using get_cpu_ptr()/put_cpu_ptr() which disable preemption and
> > return the per-CPU pointer atomically. The usbnet_skb_return() hunk
> > is a hardening change: that path runs in softirq context so no warning
> > fires there, but the same fix is applied for consistency.
> 
> This looks odd, how did we miss this for 8 years.
> 
> Greg is probably busy, but would be good to get a confirmation
> from either him or some other USB expert that the callbacks
> can indeed be called in process context.

They can be called in BH context with interrupts enabled.  Is that close 
enough?

Alan Stern
