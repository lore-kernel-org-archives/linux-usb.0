Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686757;
	b=ESRf4MTtPiJM6FYHtlJgPBzk17xLPY9XLcF4u6cciN4ZijznzS1Bw5koLJVdzGWz0SH8
	 DKspFOFf5+hMCUVl2R+2sbPjTWqFg3mKgQSY6CVOaExk1UPVrktGa/Xts+xZYv5rbV3W0
	 ramvKmjAd1UQ4SYM9gigIrwWNUYaWPUquxpn7wmGQRZ2ISe8NgbU4xy+DS8iobfsi3y5W
	 mUhWrJJx4fz2EM51l1QNOWfwHdNFmUq9g3wYt5vwlW8UTjwPJpcZh1crkQRqs6fIuknMJ
	 HhA2fBU3H+3+hLu8WRtGVwsP0mmqHsyN9DvM2UAlY1IMmPHM/W2HgWWaniLCcRFMJVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
	b=kgwaHpePxrnCwfN1amwm46j5yx379PDNudTz8ug2adZSbwKd3k9dJQbVsJtFhsGQDEdI
	 hHGtv1BFlh4sufVayEkyLBc5mkQu4jTGoZf6F+5a4mx4gK1m6NZuTGpFJOjTIP1o4jqlI
	 QfczJptiSQL1NOLkh3ye6gIJ8VofH0LCkc+ApNNDKCx2yOO43mEO0u1rXj7ICW0Y9QZhk
	 e7D9iu26hZ1PCNHcDRSpmjGsmBf1vsTOF1mWwJIvrTajm5w0JfJl7OxKiXSiOpTFu+YOw
	 Az/vQJIZDzmhdDaXpJRYQ4F6sJM26Ulca5N312P8C6McGoi3AZ6XfOvyxzUzEtL+JNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ZNpsvJMi;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEF1606A323
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 20:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AEF1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ZNpsvJMi
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b2382bf051so1354515b3a.3
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 12:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686756; x=1795291556; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
        b=ZNpsvJMizOoFFuviUq3R3I7xBszXKHR6f+dU2Lhp8+AdJOsuucW/Jpjz4DKxOc01P8
         7Bf2gXYBYorSyL2ypHSps7l13uEx7uOW/BQ3oCjgyM7fn4nszFId/ZhifmOhhkUhMak/
         Krv6vg2ZKrT882kZ97nfZeCj+rR5WiJ1p/wW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686756; x=1795291556;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
        b=t8Vwi/xkIf+fRMzuL9Ou3V1WNfKMVSwOFA9IOtEWoQEhNBXMIlHThJTS8ibD9n6cjo
         3r39zkoD81P5y+brG2fQNYIT4q/9XxlJcwFZT9PTqfy7sh1WVUTs4SCH2emoIP9ksNok
         fMe1cai2FptrBmu8eYHALslGb3IlDbcjluUaWIQ5takQw9VEZEukD5QyHxDq/8KXCAg9
         4Szg4vV9YAa4TXZE7Vb8vS3IG6nJ9esbp4NgODMz3/kbvgjXnrNrtl/n2AhkEj9/nVSv
         OK8T6lXSuv3vgJQ4bSPsxo1GFEgm6h0FEp8FkHzjgPZ7NFV1jkzYBJZPCIXsnWlMMLKo
         9Gdg==
X-Forwarded-Encrypted: i=1; AL+hErGrbQhmT0DsCLfZOIGProJDyW/WWsWy+bLKKx5jME868J/Xl5ypVu1lSCdjku9fkyYkUvWe8olWvFA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wmLrsiPw59ZGQe4fNkIPB8P1JvgFrR2Z5zzg1nQHCb4r75ihi
	wCtRLyeOVcEkeZ0MoTNV5S7XZbOtXaMZQVFmKfcehghRIbCOWnP2F6PbG5f5LGRLZ7k=
X-Gm-Gg: AYBFou2YSn4y+MlLVhGoUSgJkR/q61Zl5++I0d6FsY37NJ2av1LDyWFHESKrlgSRLh0
	vESd3mbIjsR0OfU3lkLNUMkZF2K9srV59BJUyMDTgbQy20tyzCzE8BoiJundIx4+u/6YI82g1Jf
	RHjpAT4VydukdYCA7XjJBAUqT2tnA+6w3vaS3aEMdgFxa34pHJd0rNdhnVMVxNk+7w7Oexbcblb
	KlgxNOBel48vx9csbkqo/W47P6Bg4fz6Q63Ye3rxkzVf6q1QIX85/2+QmI4aPPX3LlGrzM9zv+K
	x78wiCgwH1bzZo24XtnD1n1LeUss//ZZBTMJ/CcUffslTmfYVAoKdkLvgIlo9TY74SLFx27eApo
	CejGRyvGkQbXs2Vy5JP00CusmtDuL4nc73fFzXKWIM2VUQ+VkrJt9L6kM0pBHBIDfNNkX4XxQq8
	GJRzpJk9m3O5fk4HyVKHNoYsg/fr3qTy83pdS5PZII6jF5ofM/byDHNs5Z8n1u4KjIWpQtlZ5o7
	dYu5NI64wE1O/Ih2OKvXRKVIE4ErrqpZHmCBYnq9/woj59S+drQ612mGNS9/pk+kXp8PG72HB2Z
	As0JYPU9bCBizpjgjPK1aKuESEHc05i6CdHx5rgAfcMgTCBaFRs5W3sa4K8ZNjm4mk0Mvmrrpha
	748OVFAIV5tfUocwAmUzPk9WYk89Um5kocXA85yusKjhzf9n9E844CsGGCzbj4T4t/T8jUWYXXf
	240GFGdBxcu9EB4RS8kMeqPO501D8yGsgLw7dVkH5pLvjI0tQla5LuAhA6
X-Received: by 2002:a05:6a21:748b:b0:3e3:37ff:3795 with SMTP id adf61e73a8af0-3f7a4dbfbbfmr5517650637.7.1794686756009;
        Sat, 14 Nov 2026 12:05:56 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm2271197b3a.13.2026.11.14.12.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:05:54 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:50 -0800
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
	stable@vger.kernel.org, Alexander Mikhalitsyn <alex@amutable.com>,
	Breno Leitao <leitao@debian.org>, Casey Schaufler <casey@schaufler-ca.com>,
	Chuck Lever <cel@kernel.org>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH RFC v2 00/42] fs: don't use pseudo filesystem files as
	storage
In-Reply-To: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
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
Message-ID: <20261114120550.0c9e73aa12a3072c@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Patches 1-11, 13-16, 18-26, 28, 31, 32, 34-37 and 39-42 look good to me,
so for those please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>

I've also tested 5, 6, 34-37, 41 and 42. The selftests all pass with the
series applied, and a uid 0 without capabilities can no longer change
/sys/kernel/reboot/mode through a loop device. So for those, please also
feel free to add:

Tested-by: Chris Down <chris@chrisdown.name>

I've replied separately to 17 and 33.

Thanks!

Chris
