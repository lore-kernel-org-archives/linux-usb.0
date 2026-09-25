Received: from smtpout07.a1.net (smtpout07.a1.net [80.75.33.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A31F36F8F1
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 06:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.75.33.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790317288; cv=none; b=jSjOc7LmeV9eOv7rBZkWgdiwr/GgHDkIVCNxl217koBYTau7x9MhtalZsFUmvyvBYbs5R8BlNO5XiWLld67sgQW7NX5XGbDfv8yrEd6i4Q5wiF79QT6BbVZqy0+IF1qQgPan4NHzv4f2+ozDqju4AYcObgVc8vCRz6a/p1Divis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790317288; c=relaxed/simple;
	bh=ZASyk0FIV3LHzDXnTMsnN4v32O0auOY6o6oysj7s5uY=;
	h=Subject:References:To:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=U0FTPkCNod9nLqrFgq+GIjUwKkkufEJVuzuibUC8WyHN5uXEdn3auhyVaa4c9QNzjbMZ44t7lRJnjTUQNbLT/dgbOhMP8gKq1nHIqY/nD4pvQLwLNCic5rpRen6gkjultTPs/60qIj0GQyCMXEy4VyM4fuI9qI9gwHTWF9x+lUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net; spf=pass smtp.mailfrom=a1.net; dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b=GHcLCQ7I; arc=none smtp.client-ip=80.75.33.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a1.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b="GHcLCQ7I"
Received: from [192.168.0.6] (unknown [100.72.67.144])
	by smtpout07.a1.net (Postfix) with ESMTPSA id 4hrgZM2mPjzGrqnn
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 08:21:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a1.net; s=resmail1;
	t=1790317275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ke7bk5/ZL1Q0oYaH3Sn3t7dDUgowjde09oEtAwnzWEM=;
	b=GHcLCQ7I6nD3q1cphFHXmdY8LW/n2KsxlYAUKMD8yfVZMotrCezWyv9VxUqUijjCykZFVK
	5a5RJgt4tOo+A1TDh26cWiGb7Qur9EZ7JwgPsXYKOd5JWXU1WVBbDgl3J6JPozN2osdkWX
	X+IuSGc3lQWuisS+jMjRc0n+noXI2ooawt94SHm/W4EY/5r5gozmIludrSOX+kpj5zfyf1
	7cqi/zfdj7oAegsekTCkWVnfkur4MySqdAV862W0peTgC/JIcNVlma2KmfMEyLJnziwtgN
	VfgCSF5mLM1274DnOK8B/0/B9Sw8NLIV8ghDK2sxhsPXTOHY8Ws/lCUe30cpyN+nLuncc8
	EcGLR2iJAeFLey36xlg3H7jlBmxHtqdXxqqkTRyIAFClHU8+8UocLiiup8Az0MO4JTXhjf
	FgkwK8Dt0fBenVhG3YoYbgL1iNM9XZZlQQW5rqST+Br2Pbzn1hFZxt5GIacAMwZWZpVzmi
	pafGMyv2q5qaGFACA7CCbIkuFio8pE+JPg4lpFWn/s2W9zkL5tiJMpAlGLW0hXliCJ3du3
	BSlDSyPp6sj/TlPFynzv7KvBtpY58l8FmpRWkTkZc6nAQZhmjeQJl26HM8J3OVXvKuxmRr
	nl83iF8H8oweFeAj009ZhV9jfXECtY6kkZ8j3h72Nl2LGf+mNDya8=
Subject: Re: possible regression in usb-storage?
References: <c6fc5257-a41f-4ae7-92fe-93284d9ebc43@a1.net>
 <79f2c208-bca0-3bf2-afdd-3bf095ff7b31@a1.net>
 <ef6be2fd-29f7-4577-a229-35058bb9191e@rowland.harvard.edu>
 <18c4b811-e91e-c163-fe1f-ee081a00602e@a1.net>
 <28d1f995-5e4b-4d01-aad4-6c5626e51e29@rowland.harvard.edu>
 <d0cd9a1e-cdb4-97c2-5bcd-1bc9f5d9173c@a1.net>
 <5ab3e86c-f209-ca72-58e7-8ea56225775b@a1.net>
 <f66b21bd-707b-4503-a40d-972832db130f@rowland.harvard.edu>
 <605c0845-cfd4-0702-4322-53d9c8037b70@a1.net>
To: linux-usb@vger.kernel.org
From: Johann Klammer <klammerj@a1.net>
Message-ID: <be5899e3-3e3e-4977-e4aa-32ca368f06cd@a1.net>
Date: Fri, 25 Sep 2026 08:20:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <605c0845-cfd4-0702-4322-53d9c8037b70@a1.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Level: 



On 9/25/26 6:37 AM, Johann Klammer wrote:
> 
> 
> On 9/25/26 4:03 AM, Alan Stern wrote:
>>
>> Maybe the drive doesn't like the 100-byte INQUIRY, even though it
>> claims to support it.  You can test this by doing (as root):
>>
>>     echo 'Seagate:Expansion SW:1024' >/proc/scsi/device_info
>>
>> before you plug in the drive.  That should suppress the 100-byte
>> INQUIRY command.
>>
>> Alan Stern
>>
> I don't seem to have that file. Am I missing a module?
Nevermind. I put it in modprobe.d

kernel 6.9.9 with no usb quirks and
options scsi_mod dev_flags="Seagate:Expansion SW:1024"
I did not get crashing threads this time. but a slew of errors.
and a 0 bytes sdd device.

> [  125.722585] usb 5-6: new high-speed USB device number 4 using ehci-pci
> [  125.927652] usb 5-6: New USB device found, idVendor=0bc2, idProduct=2039, bcd
> [  125.927686] usb 5-6: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [  125.927713] usb 5-6: Product: Expansion SW
> [  125.927733] usb 5-6: Manufacturer: Seagate
> [  125.927752] usb 5-6: SerialNumber: 00000000NACD256B
> [  125.928687] scsi host5: uas
> [  125.929390] scsi 5:0:0:0: Direct-Access     Seagate  Expansion SW     1901 PQ
> [  125.934625] scsi 5:0:0:0: Attached scsi generic sg3 type 0
> [  157.950205] sd 5:0:0:0: [sdd] Unit Not Ready
> [  157.951286] sd 5:0:0:0: [sdd] Sense Key : Hardware Error [current].
> [  157.952357] sd 5:0:0:0: [sdd] ASC=0x44 <<vendor>>ASCQ=0x81.
> [  157.953828] sd 5:0:0:0: [sdd] Read Capacity(16) failed: Result: hostbyte=DID_
> [  157.954921] sd 5:0:0:0: [sdd] Sense Key : Hardware Error [current].
> [  157.952357] sd 5:0:0:0: [sdd] ASC=0x44 <<vendor>>ASCQ=0x81.
> [  157.953828] sd 5:0:0:0: [sdd] Read Capacity(16) failed: Result: hostbyte=DID_OK driverbyte=DRIVER_OK
> [  157.954921] sd 5:0:0:0: [sdd] Sense Key : Hardware Error [current].
> [  157.956034] sd 5:0:0:0: [sdd] ASC=0x44 <<vendor>>ASCQ=0x81.
> [  157.957578] sd 5:0:0:0: [sdd] Read Capacity(10) failed: Result: hostbyte=DID_OK driverbyte=DRIVER_OK
> [  157.958688] sd 5:0:0:0: [sdd] Sense Key : Hardware Error [current].
> [  157.959789] sd 5:0:0:0: [sdd] ASC=0x44 <<vendor>>ASCQ=0x81.
> [  157.960958] sd 5:0:0:0: [sdd] 0 512-byte logical blocks: (0 B/0 B)
> [  157.962042] sd 5:0:0:0: [sdd] 0-byte physical blocks
> [  157.963454] sd 5:0:0:0: [sdd] Test WP failed, assume Write Enabled
> [  157.964703] sd 5:0:0:0: [sdd] Asking for cache data failed
> [  157.965753] sd 5:0:0:0: [sdd] Assuming drive cache: write through
> [  157.967330] sd 5:0:0:0: [sdd] Preferred minimum I/O size 4096 bytes not a multiple of physical block size (0 bytes)
> [  157.968382] sd 5:0:0:0: [sdd] Optimal transfer size 33553920 bytes not a multiple of physical block size (0 bytes)
> [  157.969763] sd 5:0:0:0: [sdd] Attached SCSI disk
> [  310.080965] usb 5-6: USB disconnect, device number 4
