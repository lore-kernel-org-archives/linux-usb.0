Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6819033DED9
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780917848; cv=none; b=Gd9Dm/1v94i8ltkb1Pe/PCYSQxmpqzZ6eoyltL3d+TQ3tHnB5tuWP9VPV5BUEj8mYw7r2R5cY7dugpNT5wHQrKvenZoAotAgr46jJS2oZgEsh/S08U7nYL9fDFLm2Hfb2AZL8AqcUq9Ltm05JHDoJGDAOpPBU9OgEXCk3cqO5yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780917848; c=relaxed/simple;
	bh=iS+84xsjBOfFrgfd/a3zTk+PeS4hZDLVnZ1oPJLYre4=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=fUl0asXumnOZRRPO0M5B3z3HH1YsZZrNSGfXc+DO1ZxwWIT047MNj+DywjBTjGlGvQEfB+e8C9pRKlKrUSjH/YC6UYYNh+0dsbNTwukoFFcQQ/crD8fDJIDnOrdkmIAF1hNdmszu/PJv5tcmcgKbBzqcl2+nXhdwWFLEdTf0Kg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MESF/pPe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MESF/pPe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so45106085e9.0
        for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 04:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780917845; x=1781522645; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGWvouMUY7Lz9Jzdksclu8g+F4ln78nTJ2fGk0Wxpwc=;
        b=MESF/pPeNTmq1HjJiK4lWsnvvqRa0mU/vCo7EsKeyWqnPNaTFzQ1Xz1168MGrhsot/
         Z8W1kJ6R04DLtdTA2Zrytd+hFR+Qgr4LOAxZEEF3zBANdLuwAE1gaULpXd9f4XuftLhm
         JjLCgmYe8fpt6RvwX5M/53oLcrbVyNBs0qx+PP+FHdUsW7suLaI8EDlPrO9LJ5Obj1x9
         uzGnMjLetxOHiVfD0Wnx1zXBYlCuwhInlfopj5ks3IdxcGpUmb7hfcm2d1LCgtzifz5I
         DYVGDUHDnj2aWDhhTpg/nKYo4l0TsWYt9LwzwbI2CfxuPLIqQrt4nWy07H9ZAxYMrWmZ
         Esqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780917845; x=1781522645;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sGWvouMUY7Lz9Jzdksclu8g+F4ln78nTJ2fGk0Wxpwc=;
        b=b28Ikg1XtOMh2grnyco0NyZMchOaj0a1NnHG6wvYkVTdneEcIAdptv27JYIKnl1UBP
         wOI/sp+LOFeVqsmzBh4M8IdoNHQhfx4nLc2F8BkO7H7mQaWNbASgWAV4fSXOheudZTdN
         C3UBnhAfv0qfrCHXrvF/26cVEewRUx5s2Rmw8pCyTUOLAdcFrLWJzNTJZ79hGaN6syO+
         fluuenosHfHnLwKMudYXZQm7lJm5H9Egj0Q13LnQjUkQjIBOiDtRfGzsix4Pkw0Yv0ud
         76NnHoAWgu8ecLy7QU9oQIL9RLbf14Xko4WVW3RfLxnySTmJCzVjbrrrY8DvZrWTJZyG
         bJSA==
X-Forwarded-Encrypted: i=1; AFNElJ+wgK5CpKWgApMhIwZ8KjoXvK4d25RZFpMcbXD+09xW68ht1OOhe04jB+6D/cfB4b037XrB1RVUyEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsccrnDfkb/1d2xZGccVVPfBNeYG1RQLyIUUQjF8wDILXKMvPn
	I8UTGAdOksu0RZId5C3rt2KPpmcEBD34WIjjGM+BWYH8A+m7Fd3CiGd5qsyA8bgPQCBMyIXGOC1
	+KGmwOFM=
X-Gm-Gg: Acq92OHJsgfKpCCCYmJTPeu26kptsdacnT0uO/Dbdv4qN5mIZeqkd0zYIKHfevKY8Mn
	K/PUeJG1CxTRDYC4H5WIF/xygnGil5xAOrkVVsBlR1PNRhiNVwehxYuCV9FwL8mKLI7HWiDy7fx
	kFkvQ/T2vqs673igvCQYx1uE9YJgkugiCTRexS+kdTnLGG8wDc8yhRqyBBZuzYD8mNZRiCCem2a
	F8S3/dtkLoIjfTADzpdICBBkeEjs5SYQd7hAJkMoYsdjPy+OnmwJYBB+ObZUorvyDTTHR04Q5Da
	Zza4lbeit8bXcu1CK7aGykRYRXKgS5apET1q1z778Ndr3AcH6EgA5cARkpZITM4e9i09WwkOJ3w
	zgjffefDqAz4N9PiADTP0S4MyEdh/DPwAg4gdv3wh8/m4UDl1gpqEPZZD+p9aRcrPim4W2INT4f
	5s0nx11aSsAbyg4Po1+faMoGgBgVCw1HD/1DM407tmPRIFCBUXsQfXSNOGvtKK94js6qSQQsm3+
	DBn
X-Received: by 2002:a05:600c:3153:b0:490:b8c0:d46a with SMTP id 5b1f17b1804b1-490c2604790mr253953115e9.22.1780917844870;
        Mon, 08 Jun 2026 04:24:04 -0700 (PDT)
Received: from ?IPV6:2001:a61:1348:2c01:d2c3:7046:15b5:2977? ([2001:a61:1348:2c01:d2c3:7046:15b5:2977])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b82sm418814515e9.1.2026.06.08.04.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 04:24:04 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------lK3dvBhrN6uzizuxdHUst703"
Message-ID: <2a50158f-34ff-41ae-8899-ba2ec6d550b3@suse.com>
Date: Mon, 8 Jun 2026 13:24:03 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] KASAN: slab-use-after-free in dev_driver_string from
 chaoskey_release
To: Alan Stern <stern@rowland.harvard.edu>,
 Shuangpeng <shuangpeng.kernel@gmail.com>
Cc: keithp@keithp.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20EC9664-054E-438B-B411-2145D347F97B@gmail.com>
 <257eb882-44dc-4e25-82f9-9cf9b455936d@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <257eb882-44dc-4e25-82f9-9cf9b455936d@rowland.harvard.edu>

This is a multi-part message in MIME format.
--------------lK3dvBhrN6uzizuxdHUst703
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.06.26 04:29, Alan Stern wrote:
  
> The simple explanation is that the chaoskey_release() routine contains
> debugging statements that reference an interface for the USB device even
> after that data structure may have been deallocated.  Since they are
> merely debugging statements, the simplest solution to the problem is to
> get rid of them.
> 
> That's what the patch below does.  You can try it out and see if it
> works.

Hi,

correct but it misses the same issue in disconnect.
You need this one on top.

	Regards
		Oliver

--------------lK3dvBhrN6uzizuxdHUst703
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-misc-chaoskey-fix-UAF-in-disconnect.patch"
Content-Disposition: attachment;
 filename="0001-usb-misc-chaoskey-fix-UAF-in-disconnect.patch"
Content-Transfer-Encoding: base64

RnJvbSA1ODY0YTdmNDU4MDcwN2EzOWUzZjU4ODFjZTMxMjg5MDk1OTg0ZGZmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBNb24sIDggSnVuIDIwMjYgMTM6MjA6MzUgKzAyMDAKU3ViamVjdDogW1BBVENI
XSB1c2I6IG1pc2M6IGNoYW9za2V5OiBmaXggVUFGIGluIGRpc2Nvbm5lY3QKCmRpc2Nvbm5l
Y3QgaGFzIHRoZSBzYW1lIGlzc3VlIGFzIHJlbGVhc2UuClRoZSBkZWJ1ZyBvdXRwdXQgcmVm
ZXJzIHRvIGEgcG90ZW50aWFsbHkgZnJlZWQgZGV2aWNlLgpKdXN0IHJlbW92ZSBpdC4KClNp
Z25lZC1vZmYtYnk6IE9saXZlciBOZXVrdW0gPG9uZXVrdW1Ac3VzZS5jb20+Ci0tLQogZHJp
dmVycy91c2IvbWlzYy9jaGFvc2tleS5jIHwgNiArLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9taXNjL2NoYW9za2V5LmMgYi9kcml2ZXJzL3VzYi9taXNjL2NoYW9za2V5LmMKaW5kZXgg
YmY0ZDkyOTRjN2M5Li4wZGYzMzcwODk2MTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL21p
c2MvY2hhb3NrZXkuYworKysgYi9kcml2ZXJzL3VzYi9taXNjL2NoYW9za2V5LmMKQEAgLTIy
MiwxMiArMjIyLDkgQEAgc3RhdGljIHZvaWQgY2hhb3NrZXlfZGlzY29ubmVjdChzdHJ1Y3Qg
dXNiX2ludGVyZmFjZSAqaW50ZXJmYWNlKQogewogCXN0cnVjdCBjaGFvc2tleQkqZGV2Owog
Ci0JdXNiX2RiZyhpbnRlcmZhY2UsICJkaXNjb25uZWN0Iik7CiAJZGV2ID0gdXNiX2dldF9p
bnRmZGF0YShpbnRlcmZhY2UpOwotCWlmICghZGV2KSB7Ci0JCXVzYl9kYmcoaW50ZXJmYWNl
LCAiZGlzY29ubmVjdCBmYWlsZWQgLSBubyBkZXYiKTsKKwlpZiAoIWRldikKIAkJcmV0dXJu
OwotCX0KIAogCWlmIChkZXYtPmh3cm5nX3JlZ2lzdGVyZWQpCiAJCWh3cm5nX3VucmVnaXN0
ZXIoJmRldi0+aHdybmcpOwpAQCAtMjQ4LDcgKzI0NSw2IEBAIHN0YXRpYyB2b2lkIGNoYW9z
a2V5X2Rpc2Nvbm5lY3Qoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVyZmFjZSkKIAkJbXV0
ZXhfdW5sb2NrKCZkZXYtPmxvY2spOwogCiAJbXV0ZXhfdW5sb2NrKCZjaGFvc2tleV9saXN0
X2xvY2spOwotCXVzYl9kYmcoaW50ZXJmYWNlLCAiZGlzY29ubmVjdCBkb25lIik7CiB9CiAK
IHN0YXRpYyBpbnQgY2hhb3NrZXlfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3Qg
ZmlsZSAqZmlsZSkKLS0gCjIuNTQuMAoK

--------------lK3dvBhrN6uzizuxdHUst703--
