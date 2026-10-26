Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020845;
	b=P2Z7BXnmsY0vu7dCGWTlm6H01DK0V+fTMBhw9U4pJBMk4qGcJKl6LoEF91D6nKePO47L
	 HBirTZTZDwpvR6sRTMFU11Gs5iYnuruzvM/bHTXfgUIPTkYjTvYuft2go5RneLD1rRa9i
	 RleR204HzQe91lfA1GayswbYnmW954cNE+X3SE9yfNGD1jhvXN8lfaIbTafx4vmTClKR6
	 pH0/wwxE1tNTribxULS0m09owGZMOwZhgPfIwQEoLSng8he+0HrsYrF0K4AQmBzYMezl4
	 jGbQiWe7oZWXNUW1A+TEC37V3ABJDwYhM8UVb3JekmPB45/29SWEwLOZFaHWmxkJDQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
	b=c84hZ3mYxP8nZGqnN8IOKv8cJ8nm9q27X8zlyHu6kabAEDrjPrLCKtDjnb38TIORDLcu
	 NuS3QTx1VnmqERk9Fyg3/5aSXi2r7DgHFxIcMY0rN/8jmYq9+JUyHiGh2j7nF7rPibebp
	 8pAifISxnw1FgYw9RvQHxpf+ymm5XvTrCvaXKmrch8UBW6SUvGRXQEWrd7lg5zXLoOhFW
	 QEKCLeqPP3GwM5ByVOwBPuETjPmZPRD+DVG+evVKi24pXhfZvNWMrs7/IiN7n2EP4m+xi
	 wgJ141H4G0xbp+11UUizzmxAgSBCy7haIGKqUtV7ddhQYdNdPoR872/pH6VUKfjD4ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WauRMrpx;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254DC606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 13:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 254DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WauRMrpx
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c418e215671so379586066b.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793020843; x=1793625643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=WauRMrpxESCrEvvxANq9HsD33ULRAd9/RpQfcJRj3x+Nq5C/hrEbrLJXSu77G4h2mj
         gdWCfopcCB4YzOAbR4M8SyB16m/KJS5fhGfhvNBsL05YiUDfev2CwTlA7CqzRBoL9FPc
         UzI/fP9f9w/UftmhT/L5EiW1Y3roXMO734yuTu4G2n5uz5I5utEuhkZ0kAU3r3DlyxkS
         KXmjUry0VhVebAoeTIFohEMIuRpo+fKDtVD7wjfCwNX18WeXSriGe2a/uy0mms5m6n5w
         Mzv7ROGeQcpuNbbam/j/yM53lNZMR83DKDwLEBpUmYRHD7BdvDSoTGKyXs0HBMPDSd3F
         NTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020843; x=1793625643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=SAxHf/Cfmr7azMGpMvTX0GiON8sc5aPluTClQ4X7CMCxVvb1hy/B1wqdQW0GxpDuHe
         PbHKXS0A7mhUuytVAhw8QVzHRAmTnDgDWqUp1qF0J+m7UVdyc/d45nkXOxmo+/CI8eVi
         cIo6dV21XhwctIXGB7bgL3o6cG/HlnR8+FrNFvmmHaPmiMVuegufhxwCbMUTveEh0WeK
         blF2t8FoTSa1ft/Nh/bBxbc7n9F+KUEyCSml1/b4yL89Zt+JzdrxrFGewvRpUkAM/jwO
         BhdBt4tu0i2SbG0GOx1A2a9pSXNR9eGMSLwM+gm1FK9kz4Cu4XPDED1WjSex2KucRz3Z
         onrA==
X-Forwarded-Encrypted: i=1; AKwUvBwl3Nrs1383zqzYmsYA17PHuERlUVtjeujjp37A5ZvGL9dgZ/X88S2IyBmwD9cEIvSm3hjY2KAPP50=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs9nOq21nxK6aTtbsGwmjSkYM8vcPxZEJFqwiGKsApracDx66h
	PHK2FTHE+5YTPN69DDUyORDRHPg1jE6y8gPKlKZYmkrtSoEAIx52I1nh
X-Gm-Gg: AYBFou1VqaX0GJbY/emmEgWp9u77yluXSwIKUFSxdFlCLXF7t5oP+muKh21U0dn1ZsK
	zreSG6kpIvKD1T465lUit9Fq4zZixnkJSBKBQOBPGPTWavbA/5e93jBxXV7UNavemQl2CoZemjn
	2a6Zn8RB8JtmOG96hpFkV/11SLfKXwq2DwEXZr3E2pypjkThAVZt9Cq+RHT+e4qVoLz5o2mBuiG
	zHHHsUWoO7ZTp3JAdHAye3XpxDqzESZf8HFqvd74ZbwQEcFyJrO1f/2Y1Yc2cTyhuo0D6Di7IJs
	Ld1tN7BsAtGqUDRUwdsC5ODXmu1sn6QuwB+PC3LJlXTDm8X4RSmCiirnhklQQSJy5e50qYtlni9
	bPwJk3frzfiyFcVkbjheYqwGzAdr6/iQkGWwpfBQgku69vd2vO2LtCKPEkBPoReI5qR6GbNzpXH
	3CWq0XSTMHDZcmUV9BMf7AEY985xT/1SFWJNN1Vdze7dQerr5xwubC1BZK5UxJElxoEh7PIgbA7
	JEV+cA8FfKLozuF10yBjDfyaAf1r+BIEyyTN6YTC/bw/0AE
X-Received: by 2002:a17:907:2da5:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c46bde088d3mr773260366b.28.1793020843337;
        Mon, 26 Oct 2026 06:20:43 -0700 (PDT)
Received: from beelink ([187.13.23.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd35004asm314324466b.4.2026.10.26.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:20:42 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Li Ximo <lixicaicai@gmail.com>
Cc: Wang Haoran <haoranwangsec@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH] usb: gadget: udc-xilinx: Fix wild pointer dereference on empty EP0 queue
Date: Mon, 26 Oct 2026 10:20:21 -0300
Message-ID: <20261026132021.220391-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023073131.637062-1-lixicaicai@gmail.com>
References: <20261023073131.637062-1-lixicaicai@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
