Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786773;
	b=Mz0SCWcSlYY9dXeggptqTK+7zVYVLYODEH49f+5TWuZkCZHve8m0W5FtOb/5RV+Cn0DQ
	 3wi/0ma5hMHs2Wk66JuOQ6IVK0qHZvOAfhzs1LrTEqP8vCG6VqNlpLaEgFKbNGCdqiN72
	 CYHaYMvhq0thxxtnMRSzbdGTZrqh/mtBMqbI0i+ehgPb12BPlLW83yY+Et9CcmWHkZCUE
	 Zgi8yzBZOu3K+HRToyTrMdBUCR4lW4nUEXJZ8c6HuTV8ZUc3K7E4rP50Pm362q0ryav/W
	 tQEVdiD66V00wkIE4BwMyopnWIOQinauYrqJ6pwkrKLAoZOnkQUZwoEgJDr/tAx/qqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bbrug+8uKkbzVoFqJqWI8dq/qGO3e+q/IPCRmFGAqNI=;
	b=LB+pKKR655ojwd2CioEQDGC2MmJIwcBXH2Ks/yVEKHet94TCwIoFMxVwJVBiR9Gt1sW/
	 mh66dKzQAOc/HV3wGzJYekoJTfJJOr/7DWs0P8PWr4Tv/JaKeJCcmYimIR9jhurCJSypm
	 cz/gSPtsSP8LMFUsbYpA4Xrr2dkHX3TIm/c4KUlOpk26PyIHflYMOmvSvvwQaSjAT2xwh
	 rS8VChzPZS9ju3t1LkW/1LG6Sbh6fCv6PhNNfdmH3xvuVqnDsJEj4vLHZkUF+KmCnyrk0
	 jC4HBZw3usugbkoAAuAu4cB73Wkd2ubPLpeVtKUsLoXsZQmlK9/Rlax0gJQsm/Cqrpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vk6aXdWt;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E7E606A31E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 13:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9E7E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vk6aXdWt
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb2893531bso4272291a12.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786772; x=1796391572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbrug+8uKkbzVoFqJqWI8dq/qGO3e+q/IPCRmFGAqNI=;
        b=vk6aXdWtZcOv9SDjgZo4aPtSXjHP+dsUNhFVOzVRoNkFMMlK1+gEIxnD8+v1GAAPAZ
         MnbHdlAcYmLOKYH6qIbCT5mhbo4d0UTu+opmk0LMaiOD58JEmx95bcBx0SRjUbGre9bD
         /eMJmucK2v+fsBny/hJogbM5zuoJZKda8VmGMi1YPY13CZlqd+arejoMq/kG2ac2MLXk
         vOraqGsFLkLW/+3ORXJIvlRIgXE6IG3CRJJx9ZnqT2V+VdoVLQLmHCfi+S3mXuhqOWKV
         JAFvTYdwGcCEh5GfPRiCiXi0tc1Qak0fVRNnDBz77gyM6W0DoSWxRl3God8MsyC6yRM3
         2L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786772; x=1796391572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbrug+8uKkbzVoFqJqWI8dq/qGO3e+q/IPCRmFGAqNI=;
        b=1HRAA3uf8SMnNTcJWuQSNiMLLfL2YQy7E+s3kEwoIPKYvOOMYIasw2me4IIpQ0hpWP
         AihlgN2dwPhXISFY/am2ZCq/QPviiiS3Ugl3myw8hoAs9rC/k/zTeY38dwggE3xjsisy
         K8gVBKViCkw3AiCBfkM+4XhRB3HscDKe8aR9fivywpvpk0lgt7yBcNGdJEJcWFbs8FaP
         mxHKylqs6GRMUM6tSZkwIic0sQO+Y7u7+5E5IsYENvHso3UtORQEoBbqOn2rM0aNKXCd
         dHHdjAfPmdzsmAte7ZB/Ghob+BY9gWo7wbJjc2Trd2wR9R7bXtdncw6OQwt0V7su+hWE
         LNvQ==
X-Gm-Message-State: APuU4Z8Tr5DJf2AtBjzeqFcitBxI75MrBYpKtb0+rfujfJQtdTiWaAHf
	3BzuUWK2xYZWPfOMhhjyu3qhmVgMxIdsMre59xl0IgnLMGZ7uPoeNTB3
X-Gm-Gg: AZFdTZeFBVSIlEApGF6qAcCsHwomgBgDGT1PQ9MpNnK1WXTpFIbMFVKrxY0qpwJmyF/
	UD5iJ4ThkYBHI5dBVwposo9LOtKibxDDMSF7Ev3/wf8/xFnSmCG0dDi7JDlkvvOpTamlsFf8Bpo
	tRB8Mo1WnadYQCgjbptK13/4H1ScJuP7m9U7/Y9KPgyYUbZebP8OMhUzvfUqvLzFWzkYhTYYmeS
	/+klHP82HsITkrwrGqyrrKfoX+4YKmLLdCh5VeYF9PI9jToK3gSU0OvztJdZPsDmtUSLDcyS1T4
	Lc0m7mkoNDUvb3OyDwMPdSnsBeYqCTnII7CNkJ2Trn6bNya53Xpp+iE9TIlt/Z9T45LRb2OUmjf
	ovtcMg47Ke/+vXeNwWlj+OvLK1J9C8BpzZCGYDs/ezbv+DHDqeHhh+YTBhoiuvD3TaLDvyfqlAg
	LQ0i1HG6Et4WpAbwcF4uspshjmOZaxUc9reDEtQ5zNWWe9AjVOAihvyejwSzyohp0u+G3MYUJMj
	x35JYM0WBsJpPGJrJgNrQHXnR+dypzJ2GM4nZNlvmNGnJz4gOilFcU0LYxbNH/pKPIhyU5sdsL4
	HbwQOkZQJeh2kmXOHGgh8zTXBtqy1CfWEQ3FJv2qHWTQdKoIf29YQYFQiBsJpkNsGjo+asGoN7O
	SlSn308CPexX1OobbERFhGcAtAV0BjFuZnVZi9xoCB6r9b8c7BjkR/7dywctNMuK1OFBI02K9Nv
	rkKwT4pIn7OU9GISJ4CsYlT5IuZoyQGyTkubPMzqs=
X-Received: by 2002:a05:6a20:cc0b:b0:400:a999:d213 with SMTP id adf61e73a8af0-4014c25005fmr27758378637.23.1795786772137;
        Fri, 27 Nov 2026 05:39:32 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdebb45c972sm4091144a12.20.2026.11.27.05.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:39:31 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] usb: phy: twl6030: fix comparator init order and teardown cleanup
Date: Fri, 27 Nov 2026 21:39:21 +0800
Message-ID: <20261127133923.1452-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

Hi Greg,

This v2 series addresses your review feedback on v1:
- Drop the unnecessary comment in twl6030_usb_probe().
- Split the v1 patch into two single-purpose patches:
  1/2 initializes twl->lock and work items before registering the
      comparator with omap_usb2_set_comparator().
  2/2 clears the comparator via omap_usb2_set_comparator(NULL) and
      cancels set_vbus_work on probe failure paths and in
      twl6030_usb_remove().

Note on drivers/phy/ti/phy-omap-usb2.c:
Automated review pointed out that omap_usb2_set_comparator() and its
comparator readers in drivers/phy/ti/phy-omap-usb2.c do not currently
synchronize concurrent updates to phy->comparator. Fixing that requires
adding synchronization in the TI PHY driver (a separate subsystem);
this series focuses on fixing the initialization ordering and missing
unregistration bugs in phy-twl6030-usb.c.

Bin Luo (University of Electronic Science and Technology of China) (2):
  usb: phy: twl6030: initialize lock and work before registering
    comparator
  usb: phy: twl6030: clear comparator on probe failure and remove

 drivers/usb/phy/phy-twl6030-usb.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

-- 
2.43.0
