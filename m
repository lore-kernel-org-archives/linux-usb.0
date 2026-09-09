Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E75A36654C
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974267; cv=none; b=Pul5PI5VP/EgZuz1gm098GZpt8r3rA+0gf5O1j8m3+cOcuwFo51ELNvpr6+REb0AUlWC0ca8LUlItR0CH/ey3L6cqyOuSLga7An4GGNQcS1IQNkYvqoLV9Ums05nqIigcsVOupbCc12wbIhVX4KPyXgtWgkD9AwmZm6NmfB6Od8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974267; c=relaxed/simple;
	bh=9x+UXlmTbEDfrQmslkKbRb4Ip5p2FmrpwjeL0fCSqfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IWO0dlOrVHFmz7uxl/NZrWtYc1NQGVCDoTiFOIrG8XI3RJoYTuI1h0MQC1nYDtRVJzHc7yr9Q5yeuicyuzct35BmXj2psAUCO0330bUjzkr8ZbUADQhR7XD11Tf+bCYLa2xhgxeHwYxqtCDjd0a323oDM0gEOn66CSg17edtBGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0Mtk0eQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0Mtk0eQ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso480735a91.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 10:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974265; x=1789579065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HseOepf2cqIK4PsWTAUNT1JQorqoMCi9XT1JmBPyS3Y=;
        b=f0Mtk0eQVN47+4UtdGduC9Cw2o7miPL8PYCWgw6D0qcUzcOeLsVNw75J3I6L5gdH4t
         7YaIr7xc9ciUx+BBtHvymKFe0Pbz0Pt6+KMgmMYuqyibjgHVvYle3i6g01Rs1jBvII4k
         KUVzNxzlwmgrPMDG+w8GfqZHnmNn+CGLmyCu6YO2+L73ZTiNhkgRlYHDSTHG+gXj6EZm
         TXGM4JPUhWG5NMCmAXlPsU1aWQsrW5Gio2Yu+W7jBnajbAC0WLrPD2J0/QxTPHf1/KFg
         H6GrV+YDkHpnHcaal6bIbS3owKSPKqDHBsVcLHN5/KuQ/CiS+JtncGAKSFWc5/oRBvYC
         QruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974265; x=1789579065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HseOepf2cqIK4PsWTAUNT1JQorqoMCi9XT1JmBPyS3Y=;
        b=O7qskzI0ZNlKvk0LM74fCtEjgE2KqX5tkAQ+Nm1h/xldb2mX/EE4jD5YrMeaIv7Jgu
         o8Pc46o3rc4FtITSjdjo7ZdltQfw8U1NvEhI0WDue8MaMDuOgbTIwCf6ImqVcuXcYcI4
         4t5alPKt0yXVX3uYNj/CdLFryEXtAqVl6j+uABVbkqog8v9T8XhGQ8av7ayR/L0Q+G03
         iPusYu68F2d02T+5eYpYz+pNTfUF5FD3zv9tmvUkOrK/GuWoe8dsJEC2Dbs+m1vB/Ocy
         Y/mUj4TUVSbElyQn4NkK+po7XPG5MszubY3CXnoKh3hmVaB2GGseEZHlG4sAkgr5zmoX
         A6tQ==
X-Forwarded-Encrypted: i=1; AKwUvByW5uzsbfCxIeGG9cESY/WnycUHzNE+ZzTX1bOVfRfsZh83xIaRjzh8rkNXSSwrErdHRgsozphVru4=@vger.kernel.org
X-Gm-Message-State: AFuF++kkw2m8Mfvo1HxCKp7QlFMVwDYp35vArYQ/YC6GoWiyWrm5L+S4
	ciuvyilH72QJbM/7qnjZrIO4O+K5m3gNrlWkV7RM7OvggULe3QFTE1fi
X-Gm-Gg: AYBFou0eaGTXL0OGAgHbcs6BSIfDKriwtEczyC8c3MM2pZu7nGN+KOXb/LYQvwDl71f
	7gV9s8CNJyZ5prZ24ZMLDKxWhn5t64YaY1OEpThdlo2gyqQxAgvvU4zjIl9dIJpSGCnpVIn8TNw
	7duvhE69W9zcOtY+gWZ/JlWv+GByS0WJKeJhEQHY9n7SwmFAIxpMsREC1IpnG7P49KJF1l+L2tS
	vmODvZXK/T1GKlQmkhN5p97NAIIGwXrKPhBXEEt+2y9Wr5UKKhpyBR1EiPAGeg29Rk9d/h0HJir
	XhRYNZXk9RRf5BNsDbh0cN7nkE4ZTt5jQf42LUN/3xG/PMNojndP5mAaQiJimpH1fTvxnZPdgBD
	j522mvtNpY5qRF7HweQKSzg37SRiy1ypqay/JQdHo6gEVdd+ITKzAljMmxKSHqVJDUN4NPb1/3E
	LT8awdAY6BPFezeptZwzPyleFOudtSal7uqlH6twbDwWjlbMrU0KfQjf1WPvQDZnyIUZsm+i0BD
	US/hPG0L3YaC9JptyNe
X-Received: by 2002:a17:90a:fc50:b0:398:9be6:f998 with SMTP id 98e67ed59e1d1-39d70c2ec14mr3385661a91.23.1788974264580;
        Wed, 09 Sep 2026 10:17:44 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:24ba:44ee:a9ec:98f1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7715b6d4sm412187a91.12.2026.09.09.10.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:17:41 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+356ae236154297f0d60d@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: storage: ene_ub6250: set transport_reset to avoid NULL deref
Date: Thu, 10 Sep 2026 00:17:36 +0700
Message-ID: <20260909171736.53927-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f97797b6-52ff-4c40-80b8-eb9c6bc42228@rowland.harvard.edu>
References: <f97797b6-52ff-4c40-80b8-eb9c6bc42228@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 09, 2026 at 11:59:00PM -0400, Alan Stern wrote:
> Is there any reason to think that usb_stor_Bulk_reset is appropriate for
> the ene_ub6250?

Yes: ene_ub6250 already speaks the Bulk-Only Transport wire format
underneath its own SCSI translation layer. ene_send_scsi_cmd() builds
its command/status packets with the shared struct bulk_cb_wrap /
struct bulk_cs_wrap from include/linux/usb/storage.h (same
'USBC'/'USBS' signatures, US_BULK_CB_WRAP_LEN/US_BULK_CS_WRAP_LEN
framing, and the same "0-length CSW, retry" / "CSW stalled, retry"
recovery logic as usb_stor_Bulk_transport() in transport.c). It only
uses usb_stor_bulk_transfer_buf()/usb_stor_bulk_transfer_sg() over
us->send_bulk_pipe/recv_bulk_pipe -- no control or interrupt transfer
appears anywhere in the transport. So the Bulk-Only Mass Storage Reset
request (0xFF) plus clearing halt on both bulk endpoints, which is
exactly what usb_stor_Bulk_reset() does, matches the actual wire
protocol this device uses -- it isn't a guess.

> Probably a better solution would be either to make usb_stor_probe2()
> check that us->transport_reset isn't NULL, or even better, make
> scsiglue.c:device_reset() fail immediately if us->transport_reset is
> NULL.  Either one of these would work if some other subdriver forgets
> to set transport_reset.

Agreed, that's a real gap independent of this bug -- nothing stops the
next subdriver from making the same mistake. I folded the
usb_stor_probe2() check into v2, next to the existing "transport and
protocol" check, since it's the same class of error and refusing to
probe is the safe default. Kept the ene_ub6250 transport_reset
assignment too, since that's what makes the device actually work
instead of just failing to bind.

v2 to follow.

Nguyen Ngoc Thang
