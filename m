Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815814477E8
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 13:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467246; cv=none; b=TwNVOmJvbxNjD2unaYXzX1IrCj+clOK6gHiSnz0z+rZnWit1iSjUJ+/MtdxsyGOgzBEwHTFoIf86mwFLwUwVSSRFc9W6xXzc6UR2esveW504g/M62ouYMpf1J3J0uQInEAQfntlOnkCMjO6vxYRPyxgQPrPIWCYZg9XtbxbUFJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467246; c=relaxed/simple;
	bh=1FU//cowDTmdlIKkotPaT2myviMIGSTAMt9xSmCB9tc=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=r6yYQqrywO/zBAZcp/2c6A5VrpLXXmuBBCgAV4nPRmFrbDkivm5mHZtY15m9YpuYDt6OopMvOZT+r5zEaFipyiRA0Auawq8BkQMZaetxw1td10SASeaZjFR24ZoD9sWG+EAb2nuz8dCK2WtLN6GcvSK5GG9Yv8YoYZa6IhbngCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MlpL0Y43; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MlpL0Y43"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48bbb06e746so2929813f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 06:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791467243; x=1792072043; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LK3F/qu6YDZnUAvbiTowv2Ck2ICSlCqvaW16sHY+4Gc=;
        b=MlpL0Y43W/xKDskBgE6ZfSDxDXPIaB4cgGcmMOwTplVS6RukA9OzKX+XnnZ4p6DqR3
         IhvAK9j8I/aNpnmYHCgWh2lKzdGU4B1DaVUDRejQw78GTmledbAylRf146Jg7z0lVStz
         9GkoolZjYlOoxOWszQDFUXeWsn2cDRW2r94hvc30a2syJxiFWF8aGBG2gSbgkKEX51Zq
         d6cD2SG80ewKiP1WOiZ+d//8ePaLvP8hk+WsO4X/hZKwz1iVT9tLLBPVZbbgpGBRUPSn
         caA1mkVWwM8Yf0CP2Vj3te86/JwLD3LOVw1D8XMRxkp9x9togqQubMJ+Vp4wndU2qkTV
         g/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791467243; x=1792072043;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LK3F/qu6YDZnUAvbiTowv2Ck2ICSlCqvaW16sHY+4Gc=;
        b=bdz1VLNRPqdL1gXBXzC9kv38sIsXJUE3nH972zD00REHr/JosgPvMZLuK51p6TPh8I
         plTojZ6mSqmIbK4zrNRbYeGVQgDJq4/Ok465gUGrMtK13hBqXaM5pc8UH9G4gTgiESY8
         L6C8N2IDl82Etl8yQ5WMU5UkO9DHMotby/NVBixIDbQVA3Xlwta4AqhaYuIuEk0CAjcd
         Dmbrxn2MntvPI4hMLZh4h5pXlzBM3Zu2jXMK9wIonsNsokt6SB0DWzogEeFtDW9vVid3
         fwyP7s5ZNRcdutpp3kmZfujgp5hWcXYAOyj070n67kS4mOxiaJ4U5hJOaT2gKnWWXnu/
         3fVw==
X-Forwarded-Encrypted: i=1; AKwUvBxUtbrpAYzMld7tsLv42i/9kPfy+jcfmSEYgr66rbuBg2W8PSWu3m72Fb3IYzUp1VTuIK/AAr5G5YY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgbTdscn88ECD8JSZrzCoJQmLEIvxku0cyB1nzHQntTPmAW8nH
	vfw8sCU2Il/1b4BrCYzoy9WHNILOJ86iw8dkY8sbhFgVjpsLMcyFY3cZd6s9Yiw91nCEefAFZai
	pJSrO
X-Gm-Gg: AYBFou11sL+J5i8tv6KCxMoLiYMEiwnmgNWl7/yvRpI1lla62PthTBhPJTzW37gUx26
	oIV8SjKaPBbvpEVD0IUXadKHYylVARDOosnQxLj89CZQtW04s7Gps8b2rLX5KXWP04ZBMuP4HcN
	KiP+kjj1L540cWlsf4lzFIhac2Xg8skdXj6Fx0bDIhlDAJPlTMGb9oo0b6oICay/H1LlT3qYbtk
	fmBDYmtO1+VBU/yRDx14gwPlZl2tVbN33YVy+F0yEyeJkBhYmA9xirnzRzCK4fDsuOtU8q1Y57C
	0J1i4ipu3A/JWgzvsk1iJXuE8vn/7ADNRjLpazQzpZlZV7fO/9TeImEgPqGjAwlbvVQEAUs5wBq
	1pY+Lss+UhW5C8Z3LACEL3KpGtrwJrD8lJdFU747ghvls4Q/Z/md16Y9W8LJV/DmFSpl9kMF3WV
	tx7VjJYeYc9fnbS7KLX4IPT86SXSDXXRpo8MjIB0aZFEoSGyDe5cgepk8hOOkbyEMfWGYxqvFNj
	/q404XhCgG1p8w9JI6/knEK5jqyTWMsIt32EZzIQoGTtachWgN12A==
X-Received: by 2002:a05:6000:298d:10b0:487:2777:6354 with SMTP id ffacd0b85a97d-48c728a21demr7956521f8f.48.1791467242581;
        Thu, 08 Oct 2026 06:47:22 -0700 (PDT)
Received: from ?IPV6:2001:a61:13be:f901:8903:c5f1:e7c8:72f0? ([2001:a61:13be:f901:8903:c5f1:e7c8:72f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1ffbcsm10820069f8f.36.2026.10.08.06.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:47:21 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------lpR9PswUiccBfdy0auXF76gR"
Message-ID: <7d476c99-afac-4257-9252-a71ff584b726@suse.com>
Date: Thu, 8 Oct 2026 15:47:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>, USB list <linux-usb@vger.kernel.org>
From: Oliver Neukum <oneukum@suse.com>
Subject: error handling in stub_recv_cmd_submit()

This is a multi-part message in MIME format.
--------------lpR9PswUiccBfdy0auXF76gR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I was looking at the way, errors are handled in that function
and I saw no way the different errors were reacted to makes sense.
Some errors trigger an error condition set by usbip_event_add()
while others do not. It would seem to me that all errors need
to trigger an event.

	Regards
		Oliver

--------------lpR9PswUiccBfdy0auXF76gR
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-b-usbip-error-handling-in-stub_recv_cmd_submit.patch"
Content-Disposition: attachment;
 filename*0="0001-b-usbip-error-handling-in-stub_recv_cmd_submit.patch"
Content-Transfer-Encoding: base64

RnJvbSBlMzRiZjkyNTNlMGIzOWRiYTIwYmExZDVmMTkwMjY0OWQzNWMwMjUxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBUaHUsIDggT2N0IDIwMjYgMTU6NDU6MjIgKzAyMDAKU3ViamVjdDogW1BBVENI
XSBiOiB1c2JpcDogZXJyb3IgaGFuZGxpbmcgaW4gc3R1Yl9yZWN2X2NtZF9zdWJtaXQKCklm
IGFuIGVycm9yIGhhcHBlbnMgYW4gYXBwcm9wcmlhdGUgZXZlbnQgbXVzdCBiZSB0cmlnZ2Vy
ZWQuCkNlbnRyYWxpemUgdHJpZ2dlciBldmVudHMgdG8gZW5zdXJlIHRoYXQgbm8gZXJyb3Ig
Y29uZGl0aW9ucwphcmUgbG9zdCBhbmQgcmVtYWluIHVuaGFuZGxlZC4KClNpZ25lZC1vZmYt
Ynk6IE9saXZlciBOZXVrdW0gPG9uZXVrdW1Ac3VzZS5jb20+Ci0tLQogZHJpdmVycy91c2Iv
dXNiaXAvc3R1Yl9yeC5jIHwgMjAgKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL3VzYmlwL3N0dWJfcnguYyBiL2RyaXZlcnMvdXNiL3VzYmlwL3N0dWJfcngu
YwppbmRleCAwY2NjMDViNzZjNWEuLmJjMzVjY2IwMjJhYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy91c2IvdXNiaXAvc3R1Yl9yeC5jCisrKyBiL2RyaXZlcnMvdXNiL3VzYmlwL3N0dWJfcngu
YwpAQCAtNDc5LDcgKzQ3OSw3IEBAIHN0YXRpYyB2b2lkIHN0dWJfcmVjdl9jbWRfc3VibWl0
KHN0cnVjdCBzdHViX2RldmljZSAqc2RldiwKIAlpbnQgaXNfdHdlYWtlZDsKIAogCWlmIChw
aXBlID09IC0xKQotCQlyZXR1cm47CisJCWdvdG8gZXJyX21hbGxvYzsKIAogCS8qCiAJICog
U21hdGNoIHJlcG9ydGVkIHRoZSBlcnJvciBjYXNlIHdoZXJlIHVzZV9zZyBpcyB0cnVlIGFu
ZCBidWZfbGVuIGlzIDAuCkBAIC00ODgsNyArNDg4LDcgQEAgc3RhdGljIHZvaWQgc3R1Yl9y
ZWN2X2NtZF9zdWJtaXQoc3RydWN0IHN0dWJfZGV2aWNlICpzZGV2LAogCSAqLwogCXByaXYg
PSBzdHViX3ByaXZfYWxsb2Moc2RldiwgcGR1KTsKIAlpZiAoIXByaXYpCi0JCXJldHVybjsK
KwkJZ290byBlcnJfbWFsbG9jOwogCiAJYnVmX2xlbiA9ICh1bnNpZ25lZCBsb25nIGxvbmcp
cGR1LT51LmNtZF9zdWJtaXQudHJhbnNmZXJfYnVmZmVyX2xlbmd0aDsKIApAQCAtNTYwLDEw
ICs1NjAsOCBAQCBzdGF0aWMgdm9pZCBzdHViX3JlY3ZfY21kX3N1Ym1pdChzdHJ1Y3Qgc3R1
Yl9kZXZpY2UgKnNkZXYsCiAJCS8qIGNvcHkgdXJiIHNldHVwIHBhY2tldCAqLwogCQlwcml2
LT51cmJzWzBdLT5zZXR1cF9wYWNrZXQgPSBrbWVtZHVwKCZwZHUtPnUuY21kX3N1Ym1pdC5z
ZXR1cCwKIAkJCQkJOCwgR0ZQX0tFUk5FTCk7Ci0JCWlmICghcHJpdi0+dXJic1swXS0+c2V0
dXBfcGFja2V0KSB7Ci0JCQl1c2JpcF9ldmVudF9hZGQodWQsIFNERVZfRVZFTlRfRVJST1Jf
TUFMTE9DKTsKLQkJCXJldHVybjsKLQkJfQorCQlpZiAoIXByaXYtPnVyYnNbMF0tPnNldHVw
X3BhY2tldCkKKwkJCWdvdG8gZXJyX3VyYjsKIAogCQl1c2JpcF9wYWNrX3BkdShwZHUsIHBy
aXYtPnVyYnNbMF0sIFVTQklQX0NNRF9TVUJNSVQsIDApOwogCX0gZWxzZSB7CkBAIC01OTks
MTAgKzU5NywxNiBAQCBzdGF0aWMgdm9pZCBzdHViX3JlY3ZfY21kX3N1Ym1pdChzdHJ1Y3Qg
c3R1Yl9kZXZpY2UgKnNkZXYsCiAJfQogCiAJaWYgKHN0dWJfcmVjdl94YnVmZih1ZCwgcHJp
dikgPCAwKQorCQkvKiBlcnJvciBjb25kaXRpb24gYWxyZWFkeSBzZXQgKi8KIAkJcmV0dXJu
OwogCi0JaWYgKHVzYmlwX3JlY3ZfaXNvKHVkLCBwcml2LT51cmJzWzBdKSA8IDApCi0JCXJl
dHVybjsKKwlyZXQgPSB1c2JpcF9yZWN2X2lzbyh1ZCwgcHJpdi0+dXJic1swXSk7CisJaWYg
KHJldCA8IDApIHsKKwkJaWYgKHJldCAhPSAtRVBJUEUpCisJCQlnb3RvIGVycl91cmI7CisJ
CWVsc2UKKwkJCXJldHVybjsKKwl9CiAKIAkvKiB1cmIgaXMgbm93IHJlYWR5IHRvIHN1Ym1p
dCAqLwogCWZvciAoaSA9IDA7IGkgPCBwcml2LT5udW1fdXJiczsgaSsrKSB7Ci0tIAoyLjU1
LjAKCg==

--------------lpR9PswUiccBfdy0auXF76gR--
