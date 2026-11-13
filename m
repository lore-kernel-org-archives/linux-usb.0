Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565562;
	b=ocfBi1LlNxuV4MTt1DdBNaxAQFdPTuYV5MV4GPtDiRSAlb4XFKZCzVt8cNVAbA5OZAhP
	 Y8WQUG4zHbSEG+oFTNAxnX/qSGboOGHN8jOO90QBduf2nV2MB/k4lWalCY6J+cGI/8/+q
	 ncYq35YSwRxc/mBYzKJkbqAWLja8yayw+nYvWulhRenXWReVfn45ffUHCyFV9c7QxXJmQ
	 afufJRdL0cfPzHEFZnrvEDVbgxjtZSHFF9Qc5gfgL9iox8JGGiGCU2pKpcUWHWDaWbDht
	 EXa9rVjbspOqsh5MPnXfwJ8AYKTWeXtTu70gXE9ejRiX9n+axQsZkgrdWj2c2diPJ4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=5OyDtStyAeBedN7jaZpmypaL0n4+GQJgji3UYOQMX7Y=;
	b=QxXEeyfepcatmAz2rA2hIJnCBYHpa1fIw0CS3zoCAGr1y406c7AEgN+lDZ3Kxp3RglpU
	 XlaEV+cw+zObNTr8Xor/KK9wmQxLBm/MTusC1prTixvExMoafQjkamlAMoBRv3Bjz/E0Z
	 sZa04jqdoyX/1vIs5sgQKkYl0VJl3boMisLu156ZnktV1P9+8dCGDEhkulIPMtweVQ8nS
	 cwb2ZHmb6EbUEgX1K2JSL2WRcMHj+oqNuVonND3eBbDvN3kuo/s2C6jxEbus4QrM3Ij38
	 TCQte4bqD9kaYCsrid8mvriBfpz9hA9u7xHZrCDukJwp8HSlm0W5RPg8/9qcS07ul+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EhCy1rjV;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA68F606A88B
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA68F606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=EhCy1rjV
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49ff9833fedso1224225e9.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794565560; x=1795170360; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5OyDtStyAeBedN7jaZpmypaL0n4+GQJgji3UYOQMX7Y=;
        b=EhCy1rjVxVdFrlqlBXdnWdhZOgju6UqPO7MHP0T5eDQlLH3bu4fGnJjBmSeu+X4e2W
         fqknndYp9WUsPcSw+hMOJQKeOCVQ26f4CApHOuaHiz0ZnrEcpw06GAGjRX2e/v0KskXR
         kPbczhlJA2JL/E3RYwJYZ55bjMsTqV1bcwrFG/iNBMGzSlTlhWz25UxyOw6nI4axYZSB
         u0krz81cE8qJBpZN+Gj0XIkGJFuZa0vCttP7+3dXPKfvLd7fzcQdMwTNK/JaleYs6P1m
         dJAReh6EvrYwFB4nFlJdvgjX0mrHV5c8k7KozarvFnbaOIXtcKdLHY5nOcL1YTJjLQtf
         x2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565560; x=1795170360;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OyDtStyAeBedN7jaZpmypaL0n4+GQJgji3UYOQMX7Y=;
        b=IFbSufkyIbXJX6eTYeYORSaJP+nDJRg9j7Ugy015Ncu7KWLqvWLxM49rOmGwzezG3E
         0vo7zuDT3i5W5VUy+0WciV7nOeqBBy3Z9GzWWuRmQZ8NNYY3aiy5SSe/PLQC0Yh89wA+
         MSWJTF/8soHyWvRlo1tszWiKCxRmBjWMUyNTBD8MJiDV4RreuJ0GKw/eLwgfQBeMvAsJ
         b7mcu8vvV/DMqZUGJKFL/mzao/Ip55eaoX2dhIt2QG2zqhjneCjGsRpOAGvEUKkk4HWo
         tnnTOncZq81izKbSAGSDCSJR9xwF4qXqvZ5lYDaGRhHoWF2rmV985BsSnpWOQyRE4n8k
         DXPA==
X-Forwarded-Encrypted: i=1; AL+hErHg2y+FbBkR0aqYUomcMh9rl/TDGcxhgZUsdua9IJhtUyz4SqFpfKgW9dx45IrtuCEnBaiBObXyjuo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KfkFW7ttVE7fpiWUppVAlTY8EENtnVC8+0fIuwwOOdJTiOXB/
	T6xSMKEto2Tw23RC+G8eQ83LrsSHzPIhYm7jto/iMWkM77tLleFgPtyeSAM61D62m9IT
X-Gm-Gg: AYBFou1dUs7FECReUsBM/Zs3LO53gxysH7daGa0+jRzigOEeEsbN6mgT55ANh1yI6It
	rdR5u5ZiF1qxa8B1frWyA6t5fhm93CghTGcwTfBFUh4CFxgTaTg0XAmDkjYErmcXeLqsy15ovE8
	cq5Sx9UFppwEXxCuGlWEcwzhzT6uwVly1FYbUK5GJBhwrDgz9egerwaW9efTdBMpT1KnFPaOFo7
	KAXAeYD415bLpRf8EVP5MoozCOKZjULd41vcsQVLJdNb2t6avqMjBm8DuFNY/z/zyKO69RbH7QS
	HefYDo4TvMgBhFLtb1yEpGVBZ4SFTlobez+96YBC63O9vhuPQSRuqqQxA/JR1q/IGXALJmSv4mk
	bXdw+iIxNd4OuZRFlPLFUvda2vxljoJNQ1KMzG7M+DbpZwUYyI09mUposCusJ5QxwE6tZ9sSnUp
	f4KMpNDagkAqFZ4dQRwUUNubCoIItUJASLkMfcBdB3gVSI0UbexXG9E+CyXhvGBlJaeS0rtfE4Q
	qKLQKMBTp6X4p+LMzCHUGi/b26/U2rhAmJreav0/XCksPv7XsPx99cgHeBBp++nWS1tYD354Xbo
	wDilS3eJJLLvgvVyHOJ5l6BY3aYErBw6YYCRuJ/sY/XXL+eDQClB5O6syoeuOAg=
X-Received: by 2002:a05:600c:4e49:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4bb55aa999dmr38995625e9.33.1794565560090;
        Fri, 13 Nov 2026 02:26:00 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm244439965e9.1.2026.11.13.02.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:25:59 -0800 (PST)
Message-ID: <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, Chris Mason
	 <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 11:25:57 +0100
In-Reply-To: <20261111151202.GA11391@lst.de>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
	 <20261111151202.GA11391@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Christoph,

On Wed, 2026-11-11 at 16:12 +0100, Christoph Hellwig wrote:
> I've seen setups where people use fuse to mediate access to sysfs
> sysfs in odd ways.=C2=A0 No idea if that's still around, but if so, this
> patch will break it.


Oh, that's painful. Do they use backing files for that?
It's a relatively new feature in FUSE...

Kind regards,
Alex
