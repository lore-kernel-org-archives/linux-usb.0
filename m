Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C31552EB5
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 14:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419237; cv=none; b=m/awElwhUAXftZMOfTOxk9uP3Nc7KOlk1cWHPJZG3OQQqJOLiRoKrk8gh/jHA6uuBM0hPnQGMa2I5eIip5gdRzQdB/c5zlhjeRUvnh3F2cUnl9NRzHD0JzaUTqdPr2G7bN1EUIELN4/e+CjOJOOGzv0Qf5NcH6cJ2CzxPvg6tZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419237; c=relaxed/simple;
	bh=Xj1tXuPgTXzaT3nix7piE0Gi8Q7+az0H1KHgxrxkFZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSIwOLwrXMJoqF4fxbsDGn/ohegeGr/Y+tuhoR7wD5xtaMiemcJQnhoO9KjSNVJCqhIo+5Uu62doJEyem1Xocur/jlbG/77IDQFwQDRJFCDTJyOmeXkrdhjkUZthx0K4ZOzJmFqilwHnzG5oU9RXj5lA8vDU4dSUKigqhDccpLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=YTFZ7HMD; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="YTFZ7HMD"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53669f7b518so10847541cf.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792419235; x=1793024035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5BlttwcoFjB9LyfPGuIFgEh48duPPMU/zmrf0OZAJ0E=;
        b=YTFZ7HMD0+7eZ0cb4C8DJvhGaaAIA6s1oS0hIaYf7kL2wQRV+jZYSV9KxZGeBF8JS4
         TXVFnK+81s75jp2tm77iwoWJMVq1KL3zlwcfDoqcGKhxtGkwDxujOSW4mgcSfaoEGZiQ
         yQmxvhJTVl9xc6i/eDFIxsUkRzJlChX/LeXyNHXv08kbEZMhvdu/JmMGpfxj6uDwVRZZ
         8P3SSpVfZ+KE9tzgT8BL6MIQkgfPdyVxStqzrp3TDDL5YzFc7JiyrNibTY5g30HsOeRk
         iif9nlaAjJLNu73mXLR2QYHJ5oHAh5fz+OhUR1yCr8zn7AtNSKEaCounzi30FMfcpfGi
         mIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419235; x=1793024035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5BlttwcoFjB9LyfPGuIFgEh48duPPMU/zmrf0OZAJ0E=;
        b=Q+18qY7B7g/XCgiGRNHsFR/BIyq/YBlgzV0QOzRKrwlApdbCD/nT/b/jFU0PojNcpv
         J4cl/MOua/PraFpJd+gERQgcosFlvx+uOANDaBjFhFn/FKsRdNZhUWuhOeF3FWgv55L3
         v6+ZBcC8RHBmVbHZxn4nsw4+pZ8ppUj8P06nnhp0Pipq8qqmhSdKFKD67WyxfjZrxF9Z
         9iZWaLPfQGaV6cOjX/f7RDhcjZQpxHn0dPdCMVQ1GqgwfWhRDrY+xYaYd1oor4uJWFHk
         qHmr81Z3Od/1hxRgXy6ecmHRMhYOdsCnPb5WrJ1Ex0x1Oj8chjDaY9as4M8Rgd7WweIx
         fyLg==
X-Forwarded-Encrypted: i=1; AKwUvBxJWY4VdqmnfDXI10lFlddF2G0C6lr+b+dTTLGvZpzqbG9aM+hY8+iNGkdkqaC+rNSV9nhvo9KhXCI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvEHVw9PMnVX2qPnmDWNRooBod9xNv1+mZ2H660w5wj83K4cP/
	7gvbjaLryAMxisq0BX73p6DPaBgJPIagWP4WeNJ5EsTZwHA26cxieb3KH6uOUHP8iQ==
X-Gm-Gg: AYBFou2SNISY2wzrSnU2IAhCwU0MRYHv29jhc11fmmoH07oWv/RoXBqtj1vBJZn6ciA
	8y9UtAej0ooIXqlw/TR4FYiyL8fn750zaUuRhpJI5h21iL2vUreZqMUVEpP+nG8gcnxgRuww2ha
	C4CLIFMtmo4j9ftyiia2s1wsTG7RiDVvBufUTXGFWNRI0z2qyqW0ufJbjXwUoCKkftAyPLhbObZ
	/jKe7iJ8dngiXLDpVSkxjhE1o9R4SkrPizeXAFWgS0yUUzcYh8ApAx5SeGUENSiB2n8oTxKz2ie
	nG7adzNsg6O8pPhDX1FbK9SnVfJPafN7PS4oY0pHfOnOnORC6ykX8wJL4ieZXmdO2cEHA9w7szH
	3W72CWmLjw4m0sYxO+Y1G7C+v15E2OFBoj0I58My3oPEXKcesUyKOYfmy/D/kAxYc1+5X0A01mw
	LM67UyZxDW1//JxrAhUQQI580xi/LxLwGoVR8IOXMKcpOPjCsgcHhRIUE03fYRrEm8sA9PectB7
	jtOvCub+Igqt9HaE/IywQo1WHc=
X-Received: by 2002:a05:622a:514e:b0:530:42d4:4c9a with SMTP id d75a77b69052e-5364605937emr109597891cf.44.1792419234421;
        Mon, 19 Oct 2026 07:13:54 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a8e43cfsm99785331cf.5.2026.10.19.07.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:13:52 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:13:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com, stable@vger.kernel.org,
	Antti Palosaari <crope@iki.fi>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] media: dvb-usb-v2: ec168: Reject zero-length I2C reads
Message-ID: <1ab79363-7211-475d-8529-1d5c00586f8c@rowland.harvard.edu>
References: <20261019123542.4040472-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019123542.4040472-1-andi.shyti@kernel.org>

On Mon, Oct 19, 2026 at 02:35:42PM +0200, Andi Shyti wrote:
> ec168_i2c_xfer() checks the length of the register-address
> message in a combined demodulator read, but does not validate the
> read message length. Userspace can supply a zero-length read
> through I2C_RDWR.
> 
> This reaches ec168_ctrl_msg(), which selects an IN control pipe
> for READ_DEMOD with wLength set to zero. The USB core treats
> control requests without a data stage as OUT(*), triggering the
> "BOGUS control dir" warning in usb_submit_urb().
> 
> Reject zero-length read messages with -EOPNOTSUPP before issuing
> the USB request, using the existing exit path to release the I2C
> mutex.
> 
> (*) is_out = ... || !setup->wLength;
> 
> Fixes: 2bf290be4f3e ("V4L/DVB (13364): ec168: add new driver for E3C EC168 DVB USB")
> Reported-by: syzbot+ed3ada41c4eb1c4ab78e@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=ed3ada41c4eb1c4ab78e
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: <stable@vger.kernel.org> # v2.6.33+
> ---
>  drivers/media/usb/dvb-usb-v2/ec168.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/dvb-usb-v2/ec168.c b/drivers/media/usb/dvb-usb-v2/ec168.c
> index 973b32356b17..f6b98c7d3704 100644
> --- a/drivers/media/usb/dvb-usb-v2/ec168.c
> +++ b/drivers/media/usb/dvb-usb-v2/ec168.c
> @@ -115,7 +115,7 @@ static int ec168_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msg[],
>  	while (i < num) {
>  		if (num > i + 1 && (msg[i+1].flags & I2C_M_RD)) {
>  			if (msg[i].addr == ec168_ec100_config.demod_address) {
> -				if (msg[i].len < 1) {
> +				if (msg[i].len < 1 || msg[i+1].len < 1) {
>  					i = -EOPNOTSUPP;
>  					break;
>  				}

Isn't there an I2C quirks flag to indicate that 0-length reads aren't 
allowed?  Setting that flag would be more understandable than this test.

Alan Stern
