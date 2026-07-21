Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F252DB780;
	Tue, 21 Jul 2026 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624769; cv=none; b=PDtH1i8lYshpm3JdkZG3ccHmEBgqRlJ4BqZNogtpAWYm+ZwqqCd9MEipoWx/Do8oAR4iQjo7D7Jf9mAuDdi8fc6CNuJwkuR5tGN5Q2k+vU49R6dasqTAc9QrH/x/7eQVdTKLg5hBiQhGtmM6zn3Ejd8j8g/AwhmLl6IbJbMUoig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624769; c=relaxed/simple;
	bh=PIpeij4MLN87anbd55HiYahbdIBi2fNR69Dqu0GXRm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqBCvY2oyxKrHoPu2ygw58IgYVajPqHa/lfRB6vNnWurbT4yK7FsI6sstE56gzVUJLyq75b92MzhTNUaKNhyI4i1hwz/DWxBN2YlgchMJHDCbUBFrS8ioVtTuJ8V/VTXePbhS5MZOoEg1Dv2FAA6+lC1zzxtViny2m4MuNKJEtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCFx0Oi5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCFx0Oi5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784624768; x=1816160768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PIpeij4MLN87anbd55HiYahbdIBi2fNR69Dqu0GXRm0=;
  b=kCFx0Oi55SAmAIHQFUo+2ZQKSL03/LZp6Qb3SUa3+xisFY83+B+NxO2i
   TfnEBj+yT9l3CC8/Mab/jZ3jrhw6Wgqipo5lazMI3ZSg8qcHBPpqSPiRY
   iFL9j0t5Kcj1w0NeHNuQRqLO+3+W0UnG1F6QxLRVyiEYIfVbCpalW/rPp
   g+2L/ag+uc6XKWe8V0MkNqInccHEFw3qoqUReGsc+iHx4P7DuUTXRGZM+
   CnJV9mWf/5Tg1SUIRiqIb6Rds8RPXPYBVtBQef38gK8v6ipmvJ7izJDyc
   +jUvAuEJuQa8Oi4AFzADhByO1cthWKUisTQzCNJKzg/6xQN/LTtEwEDma
   A==;
X-CSE-ConnectionGUID: PnIIBwDjTAmGPJQB7Jsfxg==
X-CSE-MsgGUID: 0I1nziAvQ8qcrWehSIudeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="89041203"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="89041203"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 02:06:06 -0700
X-CSE-ConnectionGUID: fOYI0u/PT3KkPnKwat+n8A==
X-CSE-MsgGUID: ePkWRlbyR/ew226kbX4QgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
   d="scan'208";a="261255565"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 21 Jul 2026 02:05:47 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id CDAD495; Tue, 21 Jul 2026 11:05:45 +0200 (CEST)
Date: Tue, 21 Jul 2026 12:05:44 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Amber Kao <amber.kao@ite.com.tw>
Cc: Jeson Yang <jeson.yang@ite.com.tw>, Yaode Fang <Yaode.Fang@ite.com.tw>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bling Chiang <Bling.Chiang@ite.com.tw>,
	Eric Su <Eric.Su@ite.com.tw>, Doreen Lin <doreen.lin@ite.com.tw>
Subject: Re: [PATCH v4 2/2] usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C PD
 controller driver
Message-ID: <al82aJzFzx44oXTf@kuha>
References: <20260717-ucsi-itepd-v4-0-f3ba5addd0df@ite.com.tw>
 <20260717-ucsi-itepd-v4-2-f3ba5addd0df@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-ucsi-itepd-v4-2-f3ba5addd0df@ite.com.tw>

Hi Amber,

This looks okay otherwise, but I have to ask about the i2c reads and
writes..

> +static int itepd_read_reg(struct itepd *itepd, u8 reg, void *data, u32 len)
> +{
> +	struct i2c_client *client = itepd->client;
> +	struct i2c_msg msg[2];
> +	u8 *tx_buf, *rx_buf;
> +	int ret;
> +
> +	tx_buf = kzalloc(1, GFP_KERNEL);
> +	if (!tx_buf)
> +		return -ENOMEM;

That looks completely unnecessary. You really don't need to allocate
local buffer for one byte.

> +	rx_buf = kzalloc(len, GFP_KERNEL);
> +	if (!rx_buf) {
> +		kfree(tx_buf);
> +		return -ENOMEM;
> +	}

I'm not sure about this either.

> +	tx_buf[0] = reg;
> +
> +	msg[0].addr	= client->addr;
> +	msg[0].flags	= 0;
> +	msg[0].len	= 1;
> +	msg[0].buf	= tx_buf;
> +
> +	msg[1].addr	= client->addr;
> +	msg[1].flags	= I2C_M_RD;
> +	msg[1].len	= len;
> +	msg[1].buf	= rx_buf;
> +
> +	mutex_lock(&itepd->i2c_lock);
> +	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +	mutex_unlock(&itepd->i2c_lock);
> +	if (ret < 0) {
> +		dev_err_ratelimited(&client->dev, "reg 0x%02x read failed: %d\n",
> +				    reg, ret);
> +		goto out_free;
> +	}
> +	if (ret != ARRAY_SIZE(msg)) {
> +		ret = -EIO;
> +		goto out_free;
> +	}
> +
> +	memcpy(data, rx_buf, len);

This whole thing looks almost like SMBus Block Read protocol. Can't
you just use
i2c_smbus_read_i2c_block_data(client, reg, len, data)?

> +	ret = 0;
> +
> +out_free:
> +	kfree(rx_buf);
> +	kfree(tx_buf);
> +	return ret;
> +}
> +
> +static int itepd_write_reg(struct itepd *itepd, u8 reg, const void *data, u32 len)
> +{
> +	struct i2c_client *client = itepd->client;
> +	struct i2c_msg msg[1];
> +	u8 *tx_buf;
> +	int ret;
> +
> +	tx_buf = kzalloc(len + 1, GFP_KERNEL);
> +	if (!tx_buf)
> +		return -ENOMEM;
> +
> +	tx_buf[0] = reg;
> +	memcpy(tx_buf + 1, data, len);
> +
> +	msg[0].addr	= client->addr;
> +	msg[0].flags	= 0;
> +	msg[0].len	= len + 1;
> +	msg[0].buf	= tx_buf;
> +
> +	mutex_lock(&itepd->i2c_lock);
> +	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +	mutex_unlock(&itepd->i2c_lock);

i2c_smbus_write_i2c_block_data(client, reg, len, data)?

> +	if (ret < 0) {
> +		dev_err_ratelimited(&client->dev, "reg 0x%02x write failed: %d\n",
> +				    reg, ret);
> +		goto out_free;
> +	}
> +	if (ret != ARRAY_SIZE(msg)) {
> +		ret = -EIO;
> +		goto out_free;
> +	}
> +
> +	ret = 0;
> +
> +out_free:
> +	kfree(tx_buf);
> +	return ret;
> +}

Thanks,

-- 
heikki
