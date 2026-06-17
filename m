Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC473CF1F2
	for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692926; cv=none; b=GjaKKHyNMxDNPoIQonAtzU9rtS/fdJlim0jJlz1a4KYABCyG5jeZb18+QcTHE2t3u0aFzEeuBk0XdeDEWytJtNv+1ycqmcetkmsQEKMAGCywEesMxPu43+bBS4qe8J9aXYthw1zPoCd8RBep3j0u/SeexZKSxl5s2JCmDL6jNM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692926; c=relaxed/simple;
	bh=c7GU+vOOJheBI5bH+9+zJoCGGyOB5CjxriAswJ1ED2I=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QWwsKdL0yrfsNLWnJH0zKrHwec3dYNVHe8cPKREEX+ar8VRetGbiTc9bphyv8HoR3xVqbRzbRjNenp+qmIy9YMiK66EHaBJchCyqQPoAUu9oIJ+HTOn25M5vXsV3LzG6GEpeTW0Z4TJmwOQlOlnwupYDuXYUNv2oi2SEqNZHiqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/4fr1KO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/4fr1KO"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c6d31bfc8aso284835ad.2
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 03:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692925; x=1782297725; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Shp32byu9hlKxCzWqk9Nj/HypiHplqq/D6OSeAgfj9I=;
        b=h/4fr1KO80QoztI331YMN5n9++En4n5cWABQcCG/VZMi+8xXou/F5XB1ue8K52Pry5
         +1tp2S/KHGooJNe61PNHOR/NJwgLa5QcKkp4I9ViNVhfAocGIxDJQYCLAO4HJJGyKQ8Q
         7P5Ok0hELgZu+tyPIPLKbjw7ArmdvOs5GAHa5+VOVZIX3tLVIMBUTZZW4Prn6jfzq9bt
         BO8y6ALIpgCU4B1qZ/dgsg5ZJK4PWF9ycG1XJeVVeq+71eSoyGJPN+BToiXO6oz7PIBj
         x84RwRxyTk32PBbbSByHTLShGUEsO+HhhKZtFCL1mIV1aWDOVE6Tkexi7G2J4XFFuWCq
         klew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692925; x=1782297725;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Shp32byu9hlKxCzWqk9Nj/HypiHplqq/D6OSeAgfj9I=;
        b=KvwsbfUMpCO2toCeyC69MhGdNqqREVMMHXA+GmnwJvz1V1+sibeopcIR6Sq4fJGH3/
         7W9ipN8+JeeNgWvySk/yPyABNWILaaVBe9icNv5toC1zAviy23T9Vu/aKbQ2iNZffFbj
         wYpOKbuQZcWJNDtvaLJSKjJsnd6Mx0xftxnyhIYS1FgkwPCycmFp8k5dMrLI4DTqEYzT
         1uYM5H2+mPfxH0RItnUu0MLgN+TXoaQBjallUrTrLr+bs44UetOirn5g7WEWuP9M9xyb
         qp9p+TNZiixtKVaMcpbnWIX6c+t6HaU9CzT6HxdFM9Kv4eYVDO+CIIv/jSCaiwwzb13D
         HhEQ==
X-Forwarded-Encrypted: i=1; AFNElJ81dh3MWkOKLL1TVDheRACAafa6UTG5gbk/yEaopyWjMM5LJ4FVrKTw5CdB6dWVSJxl3/HhB9Hh9WE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz89ggWlZNjowl46BN+5B8COrzBi1ASva5QrjwjbZSolhn6Zset
	2+R/1DVHN0krILyqdErHtY8EC/8kidZC1Yx3DGwvyRHWC0nQydMeVNOuEDxwlA==
X-Gm-Gg: AfdE7ckc0DG8Q6doJ82oyjoMnvzpf+jYVrbGeX+RoYF6JUsGVuFo6uTgrO68hYiwWFy
	tADVUD+7dAcxWn/S6cm5rP7RLQyxGSYtaeRbLYbTwEY1ponzcLm5xbcsrfHrYycpYujXHF5KGUh
	wC9c3KUyL9+D9/oibHyWQQmKFdd9jHoASmGapp8LKHtZlNRSXdJu/hJJVPS+vrXrZ5WOVPxL1cD
	Bk4YRx5TcYMHJ3KEv8TDgFlwuT4acGuiZ0G9jkJaItoKjNtQ8hE2deEtgi7wdxIWPhJquID9uZG
	UGgFcgoBys18GKdhGhNNRWrfaZFP8RDXKvnv0B+5v5psviamN7YyGGqP7xakdqoF9g7Bjvu7dTU
	3tz0EP9lsEB22ny8Fr+chRpegIJF9C6prCuaRec2yBhpBcbQ9asq3KYJBb7s+YL6/WUti3IO0WB
	2iR9MUHdN+tJjIA/Uh+17PjIVEyDhgb4GIFhQPOQ==
X-Received: by 2002:a17:903:198b:b0:2c1:ef9:4516 with SMTP id d9443c01a7336-2c6bc23032emr35845555ad.35.1781692925055;
        Wed, 17 Jun 2026 03:42:05 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f8c3b77sm157053155ad.29.2026.06.17.03.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:42:04 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Lixu Zhang <lixu.zhang@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: usb: ljca: possible stack overflow in ljca_enumerate_gpio()
Date: Wed, 17 Jun 2026 18:42:01 +0800
Message-ID: <178169292186.2880769.16704395469053831415@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi all,

I think ljca_enumerate_gpio() in drivers/usb/misc/usb-ljca.c can write past
the valid_pin array on the stack. I would appreciate it if you could take a
look.

The GPIO descriptor comes from the device. It carries pins_per_bank and
bank_num. The function has a small fixed array on the stack.

	u32 valid_pin[LJCA_MAX_GPIO_NUM / BITS_PER_TYPE(u32)];

That is two u32 entries. Two checks run before the loop. One matches the
reply length against the descriptor.

	if (ret != struct_size(desc, bank_desc, desc->bank_num))
		return -EINVAL;

The other bounds the pin product.

	gpio_num = desc->pins_per_bank * desc->bank_num;
	if (gpio_num > LJCA_MAX_GPIO_NUM)
		return -EINVAL;

Then the loop walks bank_num.

	for (i = 0; i < desc->bank_num; i++)
		valid_pin[i] = get_unaligned_le32(&desc->bank_desc[i].valid_pins);

Nothing checks bank_num against the size of valid_pin. The reply is capped at
60 bytes, so the struct_size check limits bank_num to 9. A device that reports
bank_num 9 with pins_per_bank 7 still passes both checks. gpio_num is 63 and
the reply is 56 bytes. The loop then writes nine u32 into the two entry array,
seven past the end.

I reproduced the write on 7.1-rc7 by running the same loop over the same stack
array with a bank_num of 9.

  BUG: KASAN: stack-out-of-bounds in ljca_enumerate_gpio
  Write of size 4 ... [32, 40) 'valid_pin'

The fix I tried rejects a bank_num too large for valid_pin before the loop.

	 	if (gpio_num > LJCA_MAX_GPIO_NUM)
	 		return -EINVAL;
	+
	+	if (desc->bank_num > ARRAY_SIZE(valid_pin))
	+		return -EINVAL;

This needs a malicious or broken LJCA device, not a remote attacker. It still
looks like a stack overflow to me. Does this look right, and is that the place
to bound it? Happy to send a proper patch once you confirm.

Thanks,
Maoyi
https://maoyixie.com/
