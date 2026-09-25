Received: from smtpout07.a1.net (smtpout07.a1.net [80.75.33.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90BD47206A
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 07:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.75.33.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322735; cv=none; b=kFmIeYDeKTR04YSrk1/861FZJDk0uiDlVZ9lp8C6vWO8cQ8g9h3irJ6jEr3o4SLU1VmTdUOZdIW16ifqkkK4RkceM8C+CzCBeHA/T7VaoO3Fxi1BQNaMz4oTxDrrQf6HbP8YBZ/ssrk44W9cmY51V1kLPrxRGShmYcL4Kzutkzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322735; c=relaxed/simple;
	bh=Cz7LqRYobKfbPmUg2Lbs+CI2DsLlbQcbT3VyIik0kL4=;
	h=Subject:References:To:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=k9GnsT2nihqDQl0pwK+37N0LFqFxHsZgDMKzi5Xy7Yfarvran/2qaoSuPTIzFTmhJ7AevTuS+hMOHZO8a5j/tT8JXi5Pf3IVBqh9EDz89l9stppwvhTREPR4aLbSEl7lqUeioZGpdFALPSuReXqs9dOHR4bXxtgicFi+m2TKj/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net; spf=pass smtp.mailfrom=a1.net; dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b=yzasSw8v; arc=none smtp.client-ip=80.75.33.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a1.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b="yzasSw8v"
Received: from [192.168.0.6] (unknown [100.72.68.49])
	by smtpout07.a1.net (Postfix) with ESMTPSA id 4hrjbD4BbszGrqnn
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 09:52:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a1.net; s=resmail1;
	t=1790322728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y8COVFxhKqL1vOEdNiRf4f4xHM68rKD3z9jipzGLIxw=;
	b=yzasSw8vVSVRxIqqFvziB2LZcq/46LxjXmQpA0e8rIiBaSZq7CzdpsBRvFyTUcl3ia7qK9
	yiUYY0US5YDP7SlbhF8H7pLd2dw2j+AZng5nHwtzH/2lslWuCD3Nyb/gdmftlL9V6+zWcl
	8FSTnDgEtCIKrIT9wNTSEcD6kW8y94HXMjS18u4HcrX7ziNAbIjDDJmuKoMlRNimXzHOYs
	3qfO5zCE7gKsYoPeuayn/G5uFAJToJMf94hTZGrgE7ZKQr7ZNYbcxO4dCSXULzpixEK8Hr
	UocRUNIA5QQ1/8jQHQuZlCMDekkqZkuSryh2OhVfM1tD0T+vjlEGRV6oPpID5ko5T1rK+Q
	JHKMWRXk1rh3ff4YCsbR+ZPd64KvhyrstBt95jfbu2UocmqRNxnBfIuGV8R4iVlsoF3SFB
	9wHdKi1JfcrSJjU4hX2YnmAgVmS4HTA0hv7X1tazsGY06bXZS6OCzh4Au6z+fei19To9JX
	gq55jq5ELJlwmQ8JcZM9WI8qlP5k5106Wa9a11Tc9QiJ8/YfjPMAJPdPwm7pLkVKhZdu2m
	qSnWXC9vMKbJG0c7JoGLgjAjYSGyG9Zhn53WoeRJDCG0r+MP2ZbGpERvRRlsXBEeJfWAKK
	H7W/WIdY2rKOQEZXiOlJc6uU5jlNxbAVVc5Di7+6w45x9Z5WdW8Ls=
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
 <be5899e3-3e3e-4977-e4aa-32ca368f06cd@a1.net>
To: linux-usb@vger.kernel.org
From: Johann Klammer <klammerj@a1.net>
Message-ID: <7e2440cb-41aa-3429-fb6f-b0f4cf761029@a1.net>
Date: Fri, 25 Sep 2026 09:51:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <be5899e3-3e3e-4977-e4aa-32ca368f06cd@a1.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Level: 



On 9/25/26 8:20 AM, Johann Klammer wrote:
[...]
>> [  157.965753] sd 5:0:0:0: [sdd] Assuming drive cache: write through
>> [  157.967330] sd 5:0:0:0: [sdd] Preferred minimum I/O size 4096 bytes 
>> not a multiple of physical block size (0 bytes)
>> [  157.968382] sd 5:0:0:0: [sdd] Optimal transfer size 33553920 bytes 
>> not a multiple of physical block size (0 bytes)
>> [  157.969763] sd 5:0:0:0: [sdd] Attached SCSI disk
>> [  310.080965] usb 5-6: USB disconnect, device number 4

On another try I can't actually reproduce this. Must have been a one-off.
*shrug*
