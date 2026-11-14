Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686759;
	b=bNPEG98WkbrZWZZH+NN0b4Dn2Iv5wWeV3EVAVF7USGjEzkstcm6ND4AuTm0dhZ8pn8ib
	 SbP7TMh6EGJOypOX1YBuLncHOHTn2ReRrKYGgRf7wVfSr1U0e+5l0Q+hadQqUxFQnYh8x
	 zk4t3zM3emKtc90DfPtMSi/v/o/Fq/HmCpMOSuGm1pMVoRkTfYuPpiVL6LMEtqwKVi8uQ
	 js+dEOQktjtYWTeb9u5pqk/+ocJ/hwXSa8066bUvDi96MhXAi4MMS3VECWqT/BmFx2E5t
	 Ftc4pAkBqLv2vHCSuS7x+bHUTOmb28lfAHx3B6dasRmDgw/PK2RRRGAkA2CGWxVDhnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
	b=fE6alxR1N8YdbPQgRfhchJaF1CC6y1ElvHohLV6xd1TzD98/HpUhF20PMGMTXeaccLGV
	 SBarhDtREimOkYdSrH+K7hk7z4xSB7QM534IGig7CnGcKStEW9P7BkoJ+KzSh5Do9qdOc
	 9J2NUgo0uM8TPbpbRoPYryUIsen7SrcYuPMFbr5ESY+6lEnBbfI9Ux+eWEkZF4QL8GKAu
	 VqxiTgh4jEfuAJyZKXH1zsJdpQ2n3VoP+0tNiuuMIIlOAY0IWJ5hsSErUlv+EtmTwIdf9
	 +HIa7UZvc95g+t61ineldrHsA1MYe1QPghRwFEREAi22h3YIlhj4v4tflWlGD2vH6xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=t4xxtvlP;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F54E606A8B5
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 20:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F54E606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=t4xxtvlP
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so814318a12.0
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 12:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686758; x=1795291558; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
        b=t4xxtvlP4RAICjpBIWPIkESb6EJJVOcRd9+LEytv251d1ZQsfD2pYblwETMOf/zroc
         BDzAo5elUgpAiRA0oYEfExHYSjjGywxztBxThvGs665InMbo4S8LytfXKr2B4Cw2IX6x
         hCl30XcWjOl3zGKKK0Vny1KN9lt2zjyLiPz3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686758; x=1795291558;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
        b=ig2LA7QR9YuJPd1SGWafL2238kA+noBpXHvc+NT47LGOORxnh2B4k3xAhFaJOl+JSv
         BBsDoYMTESQQw0XU5dMl9CBu5xISTucLFhZQ0dvPbmRNISja2261eXaJZmT06sl8c+s3
         K9xrK8iAyOZIprpkiAPM51nD4YLbwDyNMNdsBduSgD5s52xyAx9xGjLL9wAV6v9pBbBa
         5MsWBUGYnmXh8PQzaGPgZoM0KybS1m0D+vtcnqr6iKit/o/66sy//wPo+Vr8nBgAlKSB
         A7s3gqFyx8RALIMQ0YNoqi2P/Ukk8rr5+4rEHNsWS9u9hbFCPk8WMbHxJZC+5SJ24wOT
         A+jQ==
X-Forwarded-Encrypted: i=1; AL+hErGakCNrfTGA4Y4wCMQPawEqFH18sqN9y30dg6FuYrTDLpxPJncsWKOdxlSkJz1tAxY0xLHHoxsKGVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+No3kR4YtFkbfucaS0bk9zuimzg86MlKej/+gIbzS1R3G/FUE4
	HHyqZR3zzaScygF7oUcAAiZbcWmx/I2UVJN61pe1S5PVRrAFgmtS0rQ4dI1E42ILrXs=
X-Gm-Gg: AYBFou21h98+d0MAj3OI9bOVkrYVONLXuNAbvuhc/lr9x+J+gmUgPA8VnpZ9bIGTv96
	4Behdn5yQMh2vVYcDLJ0MjpUPh09XnMledH9Pl4x4K5ejBjxWSvw4HvgdSpruJECQZDa3Y7khEr
	z2Dmdvws4V79m3w2+tAYGXLo6ZwG170JdDJCEAusyUVqeChS/WBH+xxbWVh8/QgZkjYcP2ZXWq8
	aUuIvpnBRJUv1ECn3Rlvc08SCe1DZDRKHsDmHpzRBSXTOqv+5U7eyAcTFBpWjYAutKVsLmilho9
	HGl20z3OYW8B1jbmCbhdPKjvR3C2Pylhvs1wjHBooe+7KHEcbk3BbC6uDSvhlM6xixul+W18yVo
	H9345YW0mcO6AzsrkZlzJDYOHBD5uHR6hLwwjGmI1ammaVsuwecY9jnp2E9ZjzSYqyWrY+stHWR
	n1wO1rC6/cJ3THuRRtUjdtoyMJUrPxDkTgJfXNjNR1/Z8l18ZDZJtRY9XbI5+JFuUddT3vh7ohj
	FZgIX+1asDvaIyTYJY9IFPv0cn0mBL2bVsBkm5wto4SxF+18Wko0RQIo5fb3UaqImSqyWqrkkcX
	vSbLlC3xLyloH04jDMYp/7mEU1VIHb9ZV8XTPG6PCHYlK/G1vMUQwFFAEiFXgN65UEWCQoWbULw
	skYI+OwQYvCdaUXqJy5mWUukjfrtTE8NIIuA/K9/Fb4BHZ/lwwoBDwtoxAByHaLD0gSmd1SqZwV
	/kz+Sp6HD5l6IyAmup8tC3NC/cEhH3IeCwmTuqT1BzazEZ39aUcoZNXKJc
X-Received: by 2002:a17:90b:3b8a:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b1b0b5f2c1mr6192503a91.52.1794686758572;
        Sat, 14 Nov 2026 12:05:58 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b266d873sm4654869a91.1.2026.11.14.12.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:05:57 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:55 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	Alexander Mikhalitsyn <alex@amutable.com>
Subject: Re: [PATCH RFC v2 17/42] securityfs: use fc_init_pseudo()
In-Reply-To: <20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
	<20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120555.cbfaf8ab8a92fb25@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Christian Brauner writes:
>AppArmor puts a .null device node into securityfs but only ever opens
>it via dentry_open() which doesn't care about SB_I_NODEV.

Not a big deal, but userspace can see that node too, as
/sys/kernel/security/apparmor/.null. Opening it by path works in current
kernels and fails with EACCES after this patch. Now, I don't know of
anything that does that, but selinuxfs gets SB_I_NODEV cleared again in
the next patch for the same kind of node, so I think we should do the
same thing here. If not, it would be good to have a line in the
changelog saying that opening it by path is meant to stop working.

Once that's fixed, please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
